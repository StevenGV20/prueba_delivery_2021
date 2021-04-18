package com.veterinaria.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsuarioController {
	
	@RequestMapping("/verCrudClientes")
	public String verCliente() {
		return "crudClientes";
	}
	
	@RequestMapping("/verRegistroCliente")
	public String verRegistroCliente() {
		return "registrarCliente";
	}
	
	@RequestMapping("/verLogin")
	public String verLogin() {
		return "login";
	}
	
	@RequestMapping("/verTablesConsultas")
	public String verTablesConsultas() {
		return "tablesConsultas";
	}
	
	@RequestMapping("/verTablesIncidencias")
	public String verTablesIncidencias() {
		return "tablesIncidencias";
	}
	
}
