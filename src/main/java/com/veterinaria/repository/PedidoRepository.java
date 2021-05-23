package com.veterinaria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Integer>{

	@Query("Select p from Pedido p where p.cliente.idusuario = :usu")
	public abstract List<Pedido> listaPedidoByCliente(@Param("usu")int usu);

	@Query("Select p from Pedido p where p.estado = :estado")
	public abstract List<Pedido> listaPedidoByEstado(@Param("estado")String estado);
	
	@Modifying
	@Query("update Pedido p set p.estado = :estado where p.idpedido = :id")
	public abstract Pedido actualizaEstadoPedido(@Param(value = "estado")String estado,@Param(value="id")int id);
}
