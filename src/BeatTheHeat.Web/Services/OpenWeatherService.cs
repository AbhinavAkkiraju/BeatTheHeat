namespace BeatTheHeat.Web.Services;

public class OpenWeatherService : IWeatherService
{
    private readonly HttpClient _httpClient;
    private readonly Dictionary<(double, double), (WeatherForecast, DateTime)> currentCache = new();
    private readonly string apiKey;

    public OpenWeatherService(IConfiguration configuration, HttpClient httpClient)
    {
        _httpClient = httpClient ?? throw new ArgumentNullException(nameof(httpClient));
        apiKey = configuration["OpenWeather:APIKey"];
    }

    private async ValueTask<WeatherForecast?> CurrentImpl(double latitude, double longitude)
    {
        var resp = await _httpClient.GetFromJsonAsync<OpenWeatherResponse>($"https://api.openweathermap.org/data/2.5/weather?lat={latitude}&lon={longitude}&appid={apiKey}");
        if (resp is not null)
        {
            WeatherForecast forecast = new()
            {
                Date = DateTime.UtcNow,
                TemperatureC = (int)(resp.Main.Temp - 272.15),
                Humidity = (int)resp.Main.Humidity,
                City = resp.Name
            };
            currentCache[(latitude, longitude)] = (forecast, DateTime.UtcNow);
            return forecast;
        }
        return null;
    }

    public ValueTask<WeatherForecast?> CurrentAsync(double latitude, double longitude)
    {
        latitude = Math.Round(latitude, 2);
        longitude = Math.Round(longitude, 2);
        // Test to see if it's been used requested recently
        if (currentCache.TryGetValue((latitude, longitude), out var res) && DateTime.UtcNow - res.Item2 > TimeSpan.FromMinutes(5))
            return ValueTask.FromResult((WeatherForecast?)res.Item1);
        else
            return CurrentImpl(latitude, longitude);
    }
}