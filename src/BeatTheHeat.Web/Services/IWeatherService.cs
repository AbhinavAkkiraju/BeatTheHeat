namespace BeatTheHeat.Web.Services;

public interface IWeatherService
{
    ValueTask<WeatherForecast?> CurrentAsync(double latitude, double longitude);
}
