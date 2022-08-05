namespace BeatTheHeat.Web.Services;

using GeoCoordinatePortable;
using Microsoft.Azure.Cosmos;
using System.Collections.Generic;

public class CoolingCenterService : ICoolingCenterService
{
    private readonly Container _container;

    public CoolingCenterService(CosmosClient cosmosClient)
    {
        _container = cosmosClient.GetContainer("BeatTheHeat", "CoolingCenters");
    }

    public async Task<Guid> CreateCoolingCenterAsync(CoolingCenterDTO coolingCenter, Organization organization)
    {
        var c = coolingCenter.ToCoolingCenter(organization);
        await _container.CreateItemAsync(c, new(organization.Country));
        return c.Id;
    }

    public async Task<CoolingCenter> ReadCoolingCenterAsync(Guid id, string country) =>
        (await _container.ReadItemAsync<CoolingCenter>(id.ToString(), new(country))).Resource;

    public Task UpdateCoolingCenterAsync(CoolingCenter coolingCenter) =>
        _container.ReplaceItemAsync(coolingCenter, coolingCenter.Id.ToString(), new(coolingCenter.Country));
 
    public Task DeleteCoolingCenterAsync(CoolingCenter coolingCenter) =>
        _container.DeleteItemAsync<CoolingCenter>(coolingCenter.Id.ToString(), new(coolingCenter.Country));

    public async Task<IReadOnlyList<CoolingCenter>> GetNear(double lat, double lon)
    {
        // NO TIME TO OPTIMIZE QUERY.
        var iterator = _container.GetItemQueryIterator<CoolingCenter>($"SELECT * FROM c where ST_DISTANCE(c.Location, {{\"type\": \"Point\", \"coordinates\":[{lon}, {lat}]}}) < 100000");
        List<CoolingCenter> list = new();
        while (iterator.HasMoreResults)
            list.AddRange(await iterator.ReadNextAsync());
        GeoCoordinate s = new(lat, lon);
        return list.OrderByDescending(x => s.GetDistanceTo(new(x.Location.Position.Latitude, x.Location.Position.Longitude))).Take(5).ToList();
    }
}
