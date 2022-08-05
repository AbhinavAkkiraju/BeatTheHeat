namespace BeatTheHeat.Web.Services;

public interface IGeolocationService
{
    Task<IReadOnlyList<Location>> GetAddressesAsync(string query);
}
