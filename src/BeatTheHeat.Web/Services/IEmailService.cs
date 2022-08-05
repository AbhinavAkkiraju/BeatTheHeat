namespace BeatTheHeat.Web.Services;

public interface IEmailService
{
    void SendEmail(string email, string subject, string contents);
}