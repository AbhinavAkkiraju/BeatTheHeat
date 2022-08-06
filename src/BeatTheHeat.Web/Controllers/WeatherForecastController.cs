namespace BeatTheHeat.Web.Controllers;

using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/v1/weather-forecast")]
public class WeatherForecastController : ControllerBase
{
    private readonly IWeatherService _weatherService;
    private readonly IGeolocationService _geolocationService;

    public WeatherForecastController(IWeatherService openWeatherService, IGeolocationService geolocationService)
    {
        _weatherService = openWeatherService ?? throw new ArgumentNullException(nameof(openWeatherService));
        _geolocationService = geolocationService ?? throw new ArgumentNullException(nameof(geolocationService));
    }

    [HttpGet("current")]
    public async ValueTask<ActionResult<WeatherForecast?>> CurrentWeather(double latitude, double longitude)
    {
        if (latitude < -90 || latitude > 90)
            return BadRequest("Latitude must be between -90 and 90");

        if (longitude < -180 || longitude > 180)
            return BadRequest("Longitude must be between -180 and 180");

        return await _weatherService.CurrentAsync(latitude, longitude);
    }

    [HttpGet("current-address")]
    public async ValueTask<ActionResult<WeatherForecast?>> NearAddress(string address)
    {
        var res = await _geolocationService.GetAddressesAsync(address);
        if (res.Count > 0)
        {
            var loc = res[1];
            return await _weatherService.CurrentAsync(loc.Lat, loc.Lon);
        }
        return Ok(null);
    }
}