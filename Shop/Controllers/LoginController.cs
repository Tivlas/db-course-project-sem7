﻿using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Shop.Attributes;
using Shop.Services.Authentication;

namespace Shop.Controllers;
public class LoginController : Controller
{
	private readonly IShopAuthenticationService _authenticationService;

	public LoginController(IShopAuthenticationService authenticationService)
	{
		_authenticationService = authenticationService;
	}

	public IActionResult Index()
	{
		return View();
	}

	public async Task<IActionResult> Login(string email, string password, bool loginAsEmployee)
	{
		if (loginAsEmployee)
		{
			var employee = await _authenticationService.AuthenticateEmployee(email, password);

			if (employee is null)
			{
				TempData["ErrorMessage"] = "Invalid form data!";
				return View("Index");
			}
			var claims = new List<Claim>
			{
				new Claim(ClaimTypes.Name, employee!.FirstName),
				new Claim(ClaimTypes.Email, email),
				new Claim(ClaimTypes.Role, employee.EmployeeRole?.Name ?? string.Empty),
			};

			var claimsIdentity = new ClaimsIdentity(claims, "Authentication");
			await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));
		}
		else
		{
			var client = await _authenticationService.AuthenticateClient(email, password);
			if (client is null)
			{
				TempData["ErrorMessage"] = "Invalid form data!";
				return View("Index");
			}
			var claims = new List<Claim>
			{
				new Claim(ClaimTypes.Name, client!.FirstName),
				new Claim(ClaimTypes.Email, email),
				new Claim(ClaimTypes.Role, "Client"),
			};

			var claimsIdentity = new ClaimsIdentity(claims, "Authentication");
			await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));
		}
		return RedirectToAction("Index", "Home");
	}

	[HttpPost]
	[CustomAuthorize]
	public async Task<IActionResult> Logout()
	{
		await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
		return RedirectToAction("Index", "Home");
	}
}
