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

    private async Task<CoolingCenter[]> GetNearWithin(double lat, double lon, int km)
    {
        QueryDefinition queryDefinition = new("SELECT * FROM c where ST_DISTANCE(c.Location, {\"type\": \"Point\", \"coordinates\":[@lon, @lat]}) < @km");
        var iterator = _container.GetItemQueryIterator<CoolingCenter>(queryDefinition.WithParameter("@lat", lat).WithParameter("@lon", lon).WithParameter("@km", km * 1000));
        List<CoolingCenter> list = new();
        while (iterator.HasMoreResults)
            list.AddRange(await iterator.ReadNextAsync());
        GeoCoordinate s = new(lat, lon);
        return list.OrderBy(x => s.GetDistanceTo(new(x.Location.Position.Latitude, x.Location.Position.Longitude))).Take(5).ToArray();
    }

    public async Task<IEnumerable<CoolingCenter>> GetNear(double lat, double lon)
    {
        int[] distances = { 5, 10, 20, 50, 100, 200 };
        var ret = Array.Empty<CoolingCenter>();
        foreach (var dist in distances)
        {
            ret = await GetNearWithin(lat, lon, dist);
            if (ret.Length > 5) break;
        }
        return ret;
    }
}