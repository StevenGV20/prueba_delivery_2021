package com.veterinaria.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PedidoController {
	@RequestMapping("/verCarrito")
	public String verCarrito() {
		return "carritoCompras";
	}
	
	@RequestMapping("/verTracking")
	public String verTracking() {
		return "tracking";
	}
	
}
