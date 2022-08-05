namespace BeatTheHeat.Web.Services;

/// <summary>
/// Call Geospatial location services.
/// </summary>
public interface IGeolocationService
{
    /// <summary>
    /// Find addresses via a query.
    /// </summary>
    /// <param name="query"></param>
    /// <returns></returns>
    ValueTask<IReadOnlyList<Location>> GetAddressesAsync(string query);
}
