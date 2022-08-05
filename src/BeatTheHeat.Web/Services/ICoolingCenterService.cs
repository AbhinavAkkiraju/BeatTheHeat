namespace BeatTheHeat.Web.Services;

/// <summary>
/// Manage Cooling centers contected to organizations.
/// </summary>
public interface ICoolingCenterService
{
    /// <summary>
    /// Create a new cooling center under an organization.
    /// </summary>
    /// <param name="coolingCenter"></param>
    /// <param name="organization"></param>
    /// <returns></returns>
    Task<Guid> CreateCoolingCenterAsync(CoolingCenterDTO coolingCenter, Organization organization);

    /// <summary>
    /// Read cooling center 
    /// </summary>
    /// <param name="id"></param>
    /// <param name="country"></param>
    /// <returns></returns>
    Task<CoolingCenter> ReadCoolingCenterAsync(Guid id, string country);

    /// <summary>
    /// Updates cooling center. Do not change country or id.
    /// </summary>
    /// <param name="coolingCenter"></param>
    /// <returns></returns>
    Task UpdateCoolingCenterAsync(CoolingCenter coolingCenter);

    /// <summary>
    /// Deletes cooling center searching by id and country.
    /// </summary>
    /// <param name="coolingCenter"></param>
    /// <returns></returns>
    Task DeleteCoolingCenterAsync(CoolingCenter coolingCenter);

    /// <summary>
    /// Find near by cooling centers.
    /// </summary>
    /// <param name="lat"></param>
    /// <param name="lon"></param>
    /// <returns></returns>
    Task<IEnumerable<CoolingCenter>> GetNear(double lat, double lon);
}