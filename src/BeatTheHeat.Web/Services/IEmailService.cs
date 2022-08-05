namespace BeatTheHeat.Web.Services;

/// <summary>
/// Send Emails.
/// </summary>
public interface IEmailService
{
    /// <summary>
    /// Send an email.
    /// </summary>
    /// <param name="email"></param>
    /// <param name="subject"></param>
    /// <param name="contents"></param>
    void SendEmail(string email, string subject, string contents);
}