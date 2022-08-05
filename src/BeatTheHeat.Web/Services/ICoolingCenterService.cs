namespace BeatTheHeat.Web.Services;

using Microsoft.Azure.Cosmos;

public interface ICoolingCenterService
{
    Task<Guid> CreateCoolingCenterAsync(CoolingCenterDTO coolingCenter, Organization organization);

    Task<CoolingCenter> ReadCoolingCenterAsync(Guid id, string country);

    Task UpdateCoolingCenterAsync(CoolingCenter coolingCenter);

    Task DeleteCoolingCenterAsync(CoolingCenter coolingCenter);

    Task<IEnumerable<CoolingCenter>> GetNear(double lat, double lon);
}