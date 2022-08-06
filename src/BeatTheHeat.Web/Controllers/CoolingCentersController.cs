namespace BeatTheHeat.Web.Controllers;

using Microsoft.AspNetCore.Mvc;

[Route("api/v1/cooling-centers")]
[ApiController]
public class CoolingCentersController : ControllerBase
{
    private readonly ICoolingCenterService _coolingCenterService;
    private readonly IGeolocationService _geolocationService;

    public CoolingCentersController(ICoolingCenterService coolingCenterService, IGeolocationService geolocationService)
    {
        _coolingCenterService = coolingCenterService;
        _geolocationService = geolocationService;
    }

    [HttpGet("near")]
    public async Task<IEnumerable<CoolingCenterDTO>> Near(double latitude, double longitude) =>
        (await _coolingCenterService.GetNear(latitude, longitude)).Select(x => x.ToDTO());

    [HttpGet("near-address")]
    public async Task<IEnumerable<CoolingCenterDTO>> NearAddress(string address)
    {
        var res = await _geolocationService.GetAddressesAsync(address);
        if (res.Count > 0)
        {
            var loc = res[1];
            return (await _coolingCenterService.GetNear(loc.Lat, loc.Lon)).Select(x => x.ToDTO());
        }
        return Enumerable.Empty<CoolingCenterDTO>();
    }
}