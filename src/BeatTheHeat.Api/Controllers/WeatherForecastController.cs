using Microsoft.AspNetCore.Mvc;

namespace BeatTheHeat.Backend.Controllers;

[ApiController]
[Route("weatherForecast")]
public class WeatherForecastController : ControllerBase
{
    private static readonly string[] Summaries = new[]
    {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };

    private readonly ILogger<WeatherForecastController> _logger;
    private readonly OpenWeatherService _openWeatherService;

    public WeatherForecastController(ILogger<WeatherForecastController> logger, OpenWeatherService openWeatherService)
    {
        _logger = logger;
        _openWeatherService = openWeatherService ?? throw new ArgumentNullException(nameof(openWeatherService));
    }

    [HttpGet("current")]
    public async ValueTask<IActionResult> CurrentWeather(double latitude, double longitude)
    {
        if (latitude < -90 || latitude > 90)
            return BadRequest("Latitude must be between -90 and 90");

        if (longitude < -180 || longitude > 180)
            return BadRequest("Longitude must be between -180 and 180");

        return Ok(await _openWeatherService.Current(latitude, longitude));
    }
}
