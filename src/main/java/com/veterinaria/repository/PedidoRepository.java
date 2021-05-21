package com.veterinaria.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.veterinaria.entity.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Integer>{

	
}
