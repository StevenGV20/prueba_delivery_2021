package com.veterinaria.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.veterinaria.util.FunctionUtil;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table (name = "trabajador")
public class Trabajador extends Usuario{
	/*@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column (name = "idtrabajador")
	private int idtrabajador;
	*/
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaContrato;
	
	private double sueldo;
	
	public String getStrFechaConFormateada() {
		return FunctionUtil.toFechaString(fechaContrato);
	}
}
