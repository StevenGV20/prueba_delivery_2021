package com.veterinaria.services;

import java.util.List;
import java.util.Optional;

import com.veterinaria.entity.DetallePedido;
import com.veterinaria.entity.Pedido;

public interface PedidoService {
	public abstract Pedido registraPedido(Pedido bean);
	public abstract List<Pedido> listaPedido();
	public abstract List<Pedido> listaPedidoByCliente(int usu);
	public abstract List<Pedido> listaPedidoByEstado(String estado);
	public abstract Pedido updateEstadoPedido(Pedido bean);
	public abstract List<DetallePedido> buscaDetallePedidoById(int id);
}
