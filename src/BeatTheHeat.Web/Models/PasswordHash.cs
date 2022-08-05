namespace BeatTheHeat.Web.Models;

public record struct PasswordHash(byte[] Hash, byte[] Salt);
