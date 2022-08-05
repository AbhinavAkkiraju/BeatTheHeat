namespace BeatTheHeat.Web.Services;

public interface IOrganizationService
{
    Task<Guid?> CreateOrganizationAsync(OrganizationDTO organization);

    Task<Organization> ReadOrganizationAsync(Guid id, string country);

    Task<Organization> ReadOrganizationAsync(string id, string country);

    Task UpdateOrganizationAsync(Organization coolingCenter);

    Task<IList<Organization>> ReadOrganizationsWithEmailAsync(string email);

    Task<(Guid, string)?> Login(LoginRequest request);

    Task Logout();
}
