namespace BeatTheHeat.Web.Controllers;

using Microsoft.AspNetCore.Mvc;

[Route("api/v1/cooling-centers")]
[ApiController]
public class CoolingCentersController : ControllerBase
{
    private readonly ICoolingCenterService _coolingCenterService;

    public CoolingCentersController(ICoolingCenterService coolingCenterService)
    {
        _coolingCenterService = coolingCenterService;
    }

    [HttpGet("near")]
    public async Task<IEnumerable<CoolingCenterDTO>> Near(double latitude, double longitude) =>
        (await _coolingCenterService.GetNear(latitude, longitude)).Select(x => x.ToDTO());
}