﻿using Microsoft.AspNetCore.Mvc;
using Shop.Attributes;
using Shop.Services.DbServices;

namespace Shop.Controllers
{
	public class OrdersController : Controller
	{
		private readonly IOrderService _orderService;

		public OrdersController(IOrderService orderService)
		{
			_orderService = orderService;
		}

		// GET: Orders
		[CustomAuthorize(Roles = "Admin")]
		public async Task<IActionResult> Index()
		{
			var orders = await _orderService.GetListAsync();
			return View(orders);
		}
	}
}
