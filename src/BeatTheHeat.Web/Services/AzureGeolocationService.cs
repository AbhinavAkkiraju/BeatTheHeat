namespace BeatTheHeat.Web.Services;

public class AzureGeolocationService : IGeolocationService
{
    private readonly HttpClient _httpClient;
    private readonly string _apiKey;

    public AzureGeolocationService(IConfiguration configuration, HttpClient httpClient)
    {
        _httpClient = httpClient ?? throw new ArgumentNullException(nameof(httpClient));
        _apiKey = configuration["AzureGeolocation:APIKey"];
    }

    public async Task<IReadOnlyList<Location>> GetAddressesAsync(string query)
    {
        var response = await _httpClient.GetFromJsonAsync<AzureGeolocationResponse>($"https://atlas.microsoft.com/search/address/json?&subscription-key={_apiKey}&api-version=1.0&language=en-US&query={Uri.EscapeDataString(query)}");
        if (response is null)
            return Array.Empty<Location>();
        return response.Results.Select(x => new Location(x.Position.Lat, x.Position.Lon, $"{x.Address.FreeformAddress}, {x.Address.Country} ")).ToList();
    }
}
