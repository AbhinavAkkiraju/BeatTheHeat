namespace BeatTheHeat.Web.Services;

/// <summary>
/// Call openweatherapi.
/// </summary>
public class OpenWeatherService : IWeatherService
{
    // Cache responses with a timestamp for more efficient api calls.
    private readonly ConcurrentDictionary<(double, double), (WeatherForecast, DateTime)> currentCache = new();
    private readonly HttpClient _httpClient;
    private readonly string apiKey;

    public OpenWeatherService(IConfiguration configuration, HttpClient httpClient)
    {
        // Inject dependecies.
        _httpClient = httpClient ?? throw new ArgumentNullException(nameof(httpClient));
        apiKey = configuration["OpenWeather:APIKey"];
    }

    private async ValueTask<WeatherForecast?> CurrentImpl(double latitude, double longitude)
    {
        // Call the api
        var resp = await _httpClient.GetFromJsonAsync<OpenWeatherResponse>($"https://api.openweathermap.org/data/2.5/weather?lat={latitude}&lon={longitude}&appid={apiKey}");
        
        // Ensure it actually worked, sometimes it doesn't for instance the middle of an ocean.
        if (resp is not null)
        {
            // Map properties.
            WeatherForecast forecast = new()
            {
                Date = DateTime.UtcNow,
                TemperatureC = (int)(resp.Main.Temp - 272.15),
                Humidity = (int)resp.Main.Humidity,
                City = resp.Name
            };
            // Update the cache.
            currentCache[(latitude, longitude)] = (forecast, DateTime.UtcNow);
            return forecast;
        }
        return null;
    }

    /// <summary>
    /// Get the current weather with caching.
    /// </summary>
    /// <param name="latitude">between -90 and 90</param>
    /// <param name="longitude">between -180 and 180</param>
    /// <returns></returns>
    public ValueTask<WeatherForecast?> CurrentAsync(double latitude, double longitude)
    {
        // 3 digis is accurate to ~111m.
        // Round for more effective caching.
        latitude = Math.Round(latitude, 3);
        longitude = Math.Round(longitude, 3);

        // Test to see if it's been used requested recently.
        // If it's been longer than 5 minutes, rewrite it.
        if (currentCache.TryGetValue((latitude, longitude), out var res) && DateTime.UtcNow - res.Item2 > TimeSpan.FromMinutes(5))
            return ValueTask.FromResult((WeatherForecast?)res.Item1);
        else
            return CurrentImpl(latitude, longitude);
    }
}