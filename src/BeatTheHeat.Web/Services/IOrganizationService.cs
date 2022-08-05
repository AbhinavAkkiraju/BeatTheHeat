namespace BeatTheHeat.Web.Services;

/// <summary>
/// Stores and retrieves organizations that register cooling centers.
/// </summary>
public interface IOrganizationService
{
    /// <summary>
    /// Create an organization from given parameters.
    /// </summary>
    /// <param name="organization"></param>
    /// <returns></returns>
    Task<Guid?> CreateOrganizationAsync(OrganizationDTO organization);

    /// <summary>
    /// Find an organization by id and country.
    /// </summary>
    /// <param name="id"></param>
    /// <param name="country"></param>
    /// <returns></returns>
    Task<Organization> ReadOrganizationAsync(Guid id, string country);
    
    /// <summary>
    /// Find an organization by id and country.
    /// </summary>
    /// <param name="id"></param>
    /// <param name="country"></param>
    /// <returns></returns>
    Task<Organization> ReadOrganizationAsync(string id, string country);

    /// <summary>
    /// Update an organization.
    /// </summary>
    Task UpdateOrganizationAsync(Organization coolingCenter);

    /// <summary>
    /// Find an organization by email, used for authentication.
    /// </summary>
    /// <param name="email"></param>
    /// <returns>List of organzations, should be of length one or zero.</returns>
    Task<IReadOnlyList<Organization>> ReadOrganizationsWithEmailAsync(string email);

    /// <summary>
    /// Login, verifying credentials and authenticating.
    /// </summary>
    /// <param name="request"></param>
    /// <returns></returns>
    Task<(Guid, string)?> Login(LoginRequest request);

    /// <summary>
    /// Logout.
    /// </summary>
    /// <returns></returns>
    Task Logout();
}
