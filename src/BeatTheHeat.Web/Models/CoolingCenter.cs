namespace BeatTheHeat.Web.Models;

using Newtonsoft.Json;
using Microsoft.Azure.Cosmos.Spatial;

public record CoolingCenter([property: JsonProperty("id")] Guid Id, Guid Organization, string Name, Point Location, string Address, string Description, string Country)
{
    public CoolingCenterDTO ToDTO() =>
        new()
        {
            Name = Name,
            Longitude = Location.Position.Longitude,
            Latitude = Location.Position.Latitude,
            Address = Address,
            Description = Description
        };
}

public class CoolingCenterDTO
{
    public string Name { get; set; } = string.Empty;
    
    [Range(-180, 180)]
    public double Longitude { get; set; }

    [Range(-90, 90)]
    public double Latitude { get; set; }

    public string Address { get; set; } = string.Empty;

    public string Description { get; set; } = string.Empty;

    public CoolingCenter ToCoolingCenter(Organization organization) =>
        new(Guid.NewGuid(), organization.Id, Name, new(Longitude, Latitude), Address, Description, organization.Country);
}
