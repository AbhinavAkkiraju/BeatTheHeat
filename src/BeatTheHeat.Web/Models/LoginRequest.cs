namespace BeatTheHeat.Web.Models;

public class LoginRequest
{
    [EmailAddress]
    public string Email { get; set; } = string.Empty;
    [MinLength(8)]
    public string Password { get; set; } = string.Empty;
}
