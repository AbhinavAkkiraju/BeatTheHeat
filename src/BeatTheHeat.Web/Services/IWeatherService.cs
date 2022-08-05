namespace BeatTheHeat.Web.Services;

/// <summary>
/// Call weather APIs.
/// </summary>
public interface IWeatherService
{
    /// <summary>
    /// Get the current weather for a given coordinate.
    /// </summary>
    /// <param name="latitude">must be between -90 and 90</param>
    /// <param name="longitude"must be between -180 and 180></param>
    /// <returns></returns>
    ValueTask<WeatherForecast?> CurrentAsync(double latitude, double longitude);
}
