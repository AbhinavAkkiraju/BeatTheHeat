using Microsoft.AspNetCore.Mvc;

namespace BeatTheHeat.Web.Controllers
{
    [Route("api/v1/geolocation")]
    [ApiController]
    public class GeolocationController : ControllerBase
    {
        private readonly IGeolocationService _geolocationService;

        public GeolocationController(IGeolocationService geolocationService) =>
            _geolocationService = geolocationService ?? throw new ArgumentNullException(nameof(geolocationService));

        [HttpGet("geocode")]
        public ValueTask<IReadOnlyList<Location>> Geocode(string query) =>
            _geolocationService.GetAddressesAsync(query);
    }
}
