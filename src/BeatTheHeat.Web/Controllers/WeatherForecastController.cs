namespace BeatTheHeat.Web.Controllers;

using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/v1/weather-forecast")]
public class WeatherForecastController : ControllerBase
{
    private readonly IWeatherService _weatherService;

    public WeatherForecastController(IWeatherService openWeatherService)
    {
        _weatherService = openWeatherService ?? throw new ArgumentNullException(nameof(openWeatherService));
    }

    [HttpGet("current")]
    public async ValueTask<ActionResult<WeatherForecast?>> CurrentWeather(double latitude, double longitude)
    {
        if (latitude < -90 || latitude > 90)
            return BadRequest("Latitude must be between -90 and 90");

        if (longitude < -180 || longitude > 180)
            return BadRequest("Longitude must be between -180 and 180");

        return Ok(await _weatherService.CurrentAsync(latitude, longitude));
    }
}
