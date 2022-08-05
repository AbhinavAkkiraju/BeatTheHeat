namespace BeatTheHeat.Web.Services;

public interface IPasswordHashService
{
    PasswordHash CreatePasswordHash(string password);

    bool VerifyPasswordHash(string password, PasswordHash passwordHash);
}
