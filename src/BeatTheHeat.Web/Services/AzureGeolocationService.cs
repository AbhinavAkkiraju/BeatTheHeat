namespace BeatTheHeat.Web.Services;

/// <summary>
/// Call Azure maps geolocation with response caching.
/// </summary>
public class AzureGeolocationService : IGeolocationService
{
    private readonly Dictionary<string, (IReadOnlyList<Location>, DateTime)> _cache = new();
    private readonly HttpClient _httpClient;
    private readonly string _apiKey;

    public AzureGeolocationService(IConfiguration configuration, HttpClient httpClient)
    {
        _httpClient = httpClient ?? throw new ArgumentNullException(nameof(httpClient));
        _apiKey = configuration["AzureGeolocation:APIKey"];
    }

    public async ValueTask<IReadOnlyList<Location>> GetLocationsAsyncImpl(string query)
    {
        var response = await _httpClient.GetFromJsonAsync<AzureGeolocationResponse>($"https://atlas.microsoft.com/search/address/json?&subscription-key={_apiKey}&api-version=1.0&language=en-US&query={Uri.EscapeDataString(query)}");
        if (response is null)
            return Array.Empty<Location>();
        var loc = response.Results.Select(x => new Location(x.Position.Lat, x.Position.Lon, $"{x.Address.FreeformAddress}, {x.Address.Country} ")).Take(5).ToList();
        _cache[query] = (loc, DateTime.UtcNow);
        return loc;
    }

    public ValueTask<IReadOnlyList<Location>> GetAddressesAsync(string query)
    {
        query = query.Trim();
        if (_cache.TryGetValue(query, out var response) && DateTime.UtcNow - response.Item2 > TimeSpan.FromMinutes(10))
            return ValueTask.FromResult(response.Item1);
        else
            return GetLocationsAsyncImpl(query);
    }
}
