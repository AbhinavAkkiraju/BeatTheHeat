namespace BeatTheHeat.Web.Services;

using Microsoft.AspNetCore.Authentication;
using Microsoft.Azure.Cosmos;

public class OrganizationService : IOrganizationService
{
    private readonly Container _container;
    private readonly IPasswordHashService _passwordHashService;
    private readonly IHttpContextAccessor _httpContextAccessor;

    public OrganizationService(CosmosClient cosmosClient, IPasswordHashService passwordHashService, IHttpContextAccessor httpContextAccessor)
    {
        _container = cosmosClient.GetContainer("BeatTheHeat", "Organizations");
        _passwordHashService = passwordHashService ?? throw new ArgumentNullException(nameof(passwordHashService));
        _httpContextAccessor = httpContextAccessor ?? throw new ArgumentNullException(nameof(httpContextAccessor));
    }

    public async Task<Guid?> CreateOrganizationAsync(OrganizationDTO organization)
    {
        // Check for email.
        if ((await ReadOrganizationsWithEmailAsync(organization.Email)).Count is not 0)
            return null;

        // Create organization and register it in the database.
        var hash = _passwordHashService.CreatePasswordHash(organization.Password);
        var id = Guid.NewGuid();
        await _container.CreateItemAsync<Organization>(new(id, organization.Name, organization.Country, new List<Guid>(), organization.Email, hash, null), new(organization.Country));

        return id;
    }

    public async Task<Organization> ReadOrganizationAsync(Guid id, string country) =>
        (await _container.ReadItemAsync<Organization>(id.ToString(), new(country))).Resource;

    public async Task<Organization> ReadOrganizationAsync(string id, string country) =>
        (await _container.ReadItemAsync<Organization>(id, new(country))).Resource;

    public async Task<IList<Organization>> ReadOrganizationsWithEmailAsync(string email)
    {
        var query = new QueryDefinition("SELECT * FROM c WHERE c.Email = @email").WithParameter("@email", email);
        var iterator = _container.GetItemQueryIterator<Organization>(query);

        List<Organization> list = new();
        while (iterator.HasMoreResults)
            list.AddRange(await iterator.ReadNextAsync());
        return list;
    }

    public Task UpdateOrganizationAsync(Organization coolingCenter) =>
        _container.ReplaceItemAsync(coolingCenter, coolingCenter.Id.ToString(), new(coolingCenter.Country));

    public async Task<(Guid, string)?> Login(LoginRequest request)
    {
        var orgs = await ReadOrganizationsWithEmailAsync(request.Email);
        if (orgs.Count is 0)
            return null;

        var org = orgs.First();
        if (!_passwordHashService.VerifyPasswordHash(request.Password, org.PasswordHash))
            return null;

        return (org.Id, org.Country);
    }

    public Task Logout()
    {
        var cxt = _httpContextAccessor.HttpContext;
        if (cxt is not null)
            return cxt.SignOutAsync();
        else
            return Task.CompletedTask;

    }
}
