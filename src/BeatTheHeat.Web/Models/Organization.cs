namespace BeatTheHeat.Web.Models;

using Newtonsoft.Json;

/// <summary>
/// Represents an organization that may run cooling centers.
/// </summary>
public record Organization([property: JsonProperty("id")]Guid Id, string Name, string Country, List<Guid> CoolingCenters, string Email, PasswordHash PasswordHash, string? RefreshToken);

public class OrganizationDTO
{
    public string Name { get; set; } = string.Empty;
    
    [EmailAddress]
    public string Email { get; set; } = string.Empty;
    
    [MinLength(8)]
    public string Password { get; set; } = string.Empty;

    public string Country { get; set; } = string.Empty;
}
