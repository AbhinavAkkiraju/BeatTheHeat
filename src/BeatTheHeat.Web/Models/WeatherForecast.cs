namespace BeatTheHeat.Web.Models;

public record WeatherForecast
{
    public DateTime Date { get; init; }

    public int TemperatureC { get; init; }

    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);

    public int Humidity { get; init; }

    public string? Summary { get; set; }

    public string? City { get; set; }
}
