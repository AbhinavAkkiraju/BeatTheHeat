namespace BeatTheHeat.Web.Services;

using Microsoft.AspNetCore.Authentication;
using Microsoft.Azure.Cosmos;

/// <summary>
/// Mostly CRUD operations with some auth.
/// </summary>
public class OrganizationService : IOrganizationService
{
    private readonly Container _container;
    private readonly IPasswordHashService _passwordHashService;
    private readonly IHttpContextAccessor _httpContextAccessor;

    public OrganizationService(CosmosClient cosmosClient, IPasswordHashService passwordHashService, IHttpContextAccessor httpContextAccessor)
    {
        // Inject dependencies.
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

    public async Task<IReadOnlyList<Organization>> ReadOrganizationsWithEmailAsync(string email)
    {
        // Prevent SQL injection attacks with filled parameters.
        var query = new QueryDefinition("SELECT * FROM c WHERE c.Email = @email").WithParameter("@email", email);
        var iterator = _container.GetItemQueryIterator<Organization>(query);

        List<Organization> list = new();
        while (iterator.HasMoreResults)
            list.AddRange(await iterator.ReadNextAsync());
        return list;
    }

    public Task UpdateOrganizationAsync(Organization coolingCenter) =>
        _container.ReplaceItemAsync(coolingCenter, coolingCenter.Id.ToString(), new(coolingCenter.Country));

    /// <summary>
    /// Login using cookie auth.
    /// Does not work within a razor component because of inaccessable httpcontext.
    /// </summary>
    /// <param name="request"></param>
    /// <returns></returns>
    public async Task<(Guid, string)?> Login(LoginRequest request)
    {
        // Find with email.
        var orgs = await ReadOrganizationsWithEmailAsync(request.Email);
        if (orgs.Count is 0)
            return null;

        var org = orgs.First();
        if (!_passwordHashService.VerifyPasswordHash(request.Password, org.PasswordHash))
            return null;

        // return the string and country, both needed for efficient db calls.
        return (org.Id, org.Country);
    }

    /// <summary>
    /// Logout using cookie auth.
    /// Does not work within a razor component because of inaccessable httpcontext.
    /// </summary>
    /// <returns></returns>
    public Task Logout()
    {
        var cxt = _httpContextAccessor.HttpContext;
        if (cxt is not null)
            return cxt.SignOutAsync();
        else
            return Task.CompletedTask;
    }
}
