﻿using Microsoft.AspNetCore.Mvc;
using Shop.Attributes;
using Shop.Models;
using Shop.Services.DbServices;

namespace Shop.Controllers;
public class SignupController : Controller
{
	private readonly IClientService _clientService;
	private readonly IEmployeeService _employeeService;
	private readonly IRoleService _roleService;
	private IEnumerable<EmployeeRole>? _employeeRoles = null;

	public SignupController(IClientService clientService, IEmployeeService employeeService, IRoleService roleService)
	{
		_clientService = clientService;
		_employeeService = employeeService;
		_roleService = roleService;
	}

	private async Task LoadRolesAsync()
	{
		if (_employeeRoles == null)
		{
			_employeeRoles = await _roleService.GetRolesListAsync();
		}
	}

	public IActionResult Index()
	{
		return View();
	}

	public async Task<IActionResult> Signup(Client client)
	{
		if (ModelState.IsValid)
		{
			var success = await _clientService.AddClientAsync(client);
			if (!success)
			{
				TempData["ErrorMessage"] = "Invalid form data!";
				return View(client);
			}
		}
		else
		{
			TempData["ErrorMessage"] = "Invalid form data!";
			return View(client);
		}
		return RedirectToAction("Index", "Home");
	}

	[CustomAuthorize(Roles = "Admin, EmployeeManager")]
	public async Task<IActionResult> AddEmployee(Employee employee)
	{
		await LoadRolesAsync();
		if (ModelState.IsValid)
		{
			var success = await _employeeService.AddEmployeeAsync(employee);
			if (!success)
			{
				TempData["ErrorMessage"] = "Invalid form data!";
				return View((employee, _employeeRoles));
			}
		}
		else
		{
			TempData["ErrorMessage"] = "Invalid form data!";
			return View((employee, _employeeRoles));
		}
		return RedirectToAction("Index", "Home");
	}
}
