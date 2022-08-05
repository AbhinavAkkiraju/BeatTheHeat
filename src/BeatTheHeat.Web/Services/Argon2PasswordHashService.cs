namespace BeatTheHeat.Web.Services;

using Konscious.Security.Cryptography;
using System.Security.Cryptography;

/// <summary>
/// Password hash with Argon2id.
/// </summary>
public class Argon2PasswordHashService : IPasswordHashService
{
    public PasswordHash CreatePasswordHash(string password)
    {
        var salt = RandomNumberGenerator.GetBytes(16);
        return new(GetHash(password, salt), salt);
    }

    public bool VerifyPasswordHash(string password, PasswordHash passwordHash) =>
        passwordHash.Hash.SequenceEqual(GetHash(password, passwordHash.Salt));

    private static byte[] GetHash(string password, byte[] salt)
    {
        // Use the argonid password hash algorithm for securing the application.
        using Argon2id argon2 = new(Encoding.UTF8.GetBytes(password)) { DegreeOfParallelism = 2, MemorySize = 8192, Iterations = 5, Salt = salt };
        return argon2.GetBytes(128);
    }
}
