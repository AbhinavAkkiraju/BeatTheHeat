namespace BeatTheHeat.Web.Services;

/// <summary>
/// Hash and Verify passwords with salt.
/// </summary>
public interface IPasswordHashService
{
    /// <summary>
    /// Use the generate the hash and salt from a password string.
    /// </summary>
    /// <param name="password">new password</param>
    /// <returns></returns>
    PasswordHash CreatePasswordHash(string password);

    /// <summary>
    /// Verify a password against a hash and salt.
    /// </summary>
    /// <param name="password">password to test</param>
    /// <param name="passwordHash">previously generated hash</param>
    /// <returns>true if passed.</returns>
    bool VerifyPasswordHash(string password, PasswordHash passwordHash);
}
