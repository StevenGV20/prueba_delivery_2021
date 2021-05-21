package com.veterinaria.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Seleccion {
	private int idproducto;
	private int cantidad;
	private double precio;
	private double precioTotal;
}
