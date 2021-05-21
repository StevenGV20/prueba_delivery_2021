package com.veterinaria.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Embeddable
public class DetallePedidoPK implements Serializable{

	private static final long serialVersionUID = 1L;
	@Column(name = "idpedido", unique = true, nullable = false, length = 10,insertable = true,updatable = false)
	private int idpedido;
	@Column(name = "idproducto",unique = true, nullable = false, length = 10, insertable = true, updatable = false)
	private int idproducto;


}
