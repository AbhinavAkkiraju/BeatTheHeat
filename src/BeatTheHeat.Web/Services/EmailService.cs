namespace BeatTheHeat.Web.Services;

using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;
using MimeKit.Text;

public class EmailService : IEmailService
{
    private readonly string _server;
    private readonly int _port;
    private readonly string _address;
    private readonly string _password;

    public EmailService(IConfiguration configuration)
    {
        _server = configuration["SMTP:Server"];
        _port = int.Parse(configuration["SMTP:Port"]);
        _address = configuration["SMTP:Address"];
        _password = configuration["SMTP:Password"];
    }

    public void SendEmail(string recipient, string subject, string contents)
    {
        using MimeMessage email = new();
        email.From.Add(MailboxAddress.Parse(_address));
        email.To.Add(MailboxAddress.Parse(recipient));
        email.Subject = subject;
        email.Body = new TextPart(TextFormat.Plain) { Text = contents };

        using SmtpClient smtp = new();
        smtp.Connect(_server, _port, SecureSocketOptions.StartTls);
        smtp.Authenticate(_address, _password);
        smtp.Send(email);
        smtp.Disconnect(true);
    }
}
