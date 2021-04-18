package com.veterinaria.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TrabajadorController {
	
	@RequestMapping("/verCrudTrabajadores")
	public String listaTrabajadores() {
		return "crudTrabajadores";
	}
	
	@RequestMapping("/verInicioAdmin")
	public String verInicioAdmin() {
		return "inicioAdmin";
	}
	
	@RequestMapping("/verTablesVendedor")
	public String verTablesVendedor() {
		return "tablesVendedor";
	}
	
}
