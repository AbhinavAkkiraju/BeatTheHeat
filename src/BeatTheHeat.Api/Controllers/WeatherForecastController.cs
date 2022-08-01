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
    public ValueTask<WeatherForecast?> CurrentWeather(double latitude, double longitude) =>
        _openWeatherService.Current(latitude, longitude);
}
