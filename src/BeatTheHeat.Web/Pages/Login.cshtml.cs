namespace BeatTheHeat.Web.Pages;

using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;

[AllowAnonymous]
public class LoginModel : PageModel
{
    public string? ErrorMessage;

    private readonly IHttpContextAccessor _accessor;
    private readonly IOrganizationService _organizationService;

#pragma warning disable CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.
    public LoginModel(IHttpContextAccessor accessor, IOrganizationService organizationService)
#pragma warning restore CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.
    {
        _accessor = accessor;
        _organizationService = organizationService;
    }

    [BindProperty]
    public LoginRequest LoginRequest { get; set; }

    public IActionResult OnGetAsync()
    {
        return Page();
    }

    public async Task<IActionResult> OnPostAsync(LoginRequest LoginRequest)
    {
        var res = await _organizationService.Login(LoginRequest);
        if (res.HasValue)
        {
            (var id, var country) = res.Value;
            List<Claim> claims = new();
            claims.Add(new (ClaimTypes.NameIdentifier, id.ToString()));
            claims.Add(new (ClaimTypes.Country, country));
            ClaimsIdentity claimsIdentity = new(claims, CookieAuthenticationDefaults.AuthenticationScheme);

            var ctx = _accessor.HttpContext;
            if (ctx is not null)
                await ctx.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));
            return Redirect("/");
        }  
        else
        {
            ErrorMessage = "Invalid Credentials";
            return Page();
        }
    }
}