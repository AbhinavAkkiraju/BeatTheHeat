global using BeatTheHeat.Web.Models;
global using BeatTheHeat.Web.Services;
global using Microsoft.AspNetCore.Authentication.Cookies;
global using Microsoft.Azure.Cosmos;
global using System.ComponentModel.DataAnnotations;
global using System.Linq;
global using System.Reflection;
global using System.Text;

// Use Dependency injection.
var builder = WebApplication.CreateBuilder(args);

// Configure a CosmosClient with database and containers.
// It has to be synchronized but it should be fine for this case.
async Task<CosmosClient> InitCosmosClientAsync()
{
    CosmosClient cosmos = new(builder?.Configuration["CosmosDB:CONN_STR"]);
    var db = (await cosmos.CreateDatabaseIfNotExistsAsync("BeatTheHeat")).Database;
    _ = await db.CreateContainerIfNotExistsAsync("CoolingCenters", "/Country");
    _ = await db.CreateContainerIfNotExistsAsync("Organizations", "/Country");
    return cosmos;
}

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();

builder.Services.AddControllers();
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddHttpClient();
builder.Services.AddHttpContextAccessor();
builder.Services.AddSingleton(InitCosmosClientAsync().GetAwaiter().GetResult());
builder.Services.AddSingleton<IWeatherService, OpenWeatherService>();
builder.Services.AddSingleton<IPasswordHashService, Argon2PasswordHashService>();
builder.Services.AddSingleton<ICoolingCenterService, CoolingCenterService>();
builder.Services.AddSingleton<IOrganizationService, OrganizationService>();
builder.Services.AddSingleton<IGeolocationService, AzureGeolocationService>();
builder.Services.AddSingleton<IEmailService, EmailService>();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

// Show swagger even in prod, this should be changed eventually.
if (true || app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseAuthentication();
app.UseAuthorization();

app.UseRouting();

app.MapControllers();
app.MapRazorPages();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();
