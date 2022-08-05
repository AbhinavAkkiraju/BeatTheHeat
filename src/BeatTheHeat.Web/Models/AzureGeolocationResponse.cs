namespace BeatTheHeat.Web.Models;

public record AzureGeolocationAddress(
    string StreetName,
    string Municipality,
    string CountrySecondarySubdivision,
    string CountrySubdivision,
    string PostalCode,
    string CountryCode,
    string Country,
    string CountryCodeISO3,
    string FreeformAddress,
    string LocalName
);

public record struct AzureGeolocationPosition(double Lat, double Lon);

public record struct AzureGeolocationResult(AzureGeolocationAddress Address, AzureGeolocationPosition Position);

public record AzureGeolocationResponse(IReadOnlyList<AzureGeolocationResult> Results);