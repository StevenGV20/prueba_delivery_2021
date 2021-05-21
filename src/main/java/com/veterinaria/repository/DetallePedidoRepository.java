package com.veterinaria.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.DetallePedido;

public interface DetallePedidoRepository extends JpaRepository<DetallePedido, Integer>{

	@Modifying
	@Query("update Producto p set p.stock = p.stock - :can where p.idproducto = :pro")
	public abstract void actualizaStock(@Param("can")int cantidad,@Param("pro")int idproducto);
}
