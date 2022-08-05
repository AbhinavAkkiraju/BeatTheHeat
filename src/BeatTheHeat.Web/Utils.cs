namespace BeatTheHeat.Web;

public static class Utils
{
    /// <summary>
    /// List of countries for database partitioning.
    /// </summary>
    public static IReadOnlySet<string> Countries { get; }

    /// <summary>
    /// Init the countries.
    /// </summary>
    /// <exception cref="Exception">Failed to get internal resource.</exception>
    static Utils()
    {
        var assembly = Assembly.GetExecutingAssembly();
        var name = assembly.GetManifestResourceNames().Single(x => x.EndsWith("countries.txt"));
        using var stream = assembly.GetManifestResourceStream(name);
        using StreamReader reader = new(stream ?? throw new Exception("cannot find countries.txt"));

        HashSet<string> countries = new();
        while (!reader.EndOfStream)
        {
            var line = reader.ReadLine();
            if (!string.IsNullOrEmpty(line))
                countries.Add(line);
        }
        Countries = countries;
    }
}
