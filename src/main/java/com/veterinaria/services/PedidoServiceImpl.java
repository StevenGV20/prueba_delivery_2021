package com.veterinaria.services;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.veterinaria.entity.DetallePedido;
import com.veterinaria.entity.Pedido;
import com.veterinaria.repository.DetallePedidoRepository;
import com.veterinaria.repository.PedidoRepository;

@Service
public class PedidoServiceImpl implements PedidoService {

	@Autowired
	private PedidoRepository pedidoRepository;
	
	@Autowired
	private DetallePedidoRepository detalleRepository;
	
	@Override
	@Transactional
	public Pedido registraPedido(Pedido bean) {
		
		Pedido obj=pedidoRepository.save(bean);
		System.out.println("LEYENDO OBJ SERVICE:"+obj.getEstado());
		System.out.println("LEYENDO OBJ SERVICEID:"+obj.getIdpedido());
		int id=obj.getIdpedido();
		for(DetallePedido det:obj.getDetalle()) {
			System.out.println("ID_DET:"+id);
			det.getDetallePK().setIdpedido(id);
			//System.out.println("ID_DET_2:"+det.getPedido().getIdpedido());
			System.out.println("ID_DET_2:"+det.getDetallePK().getIdpedido());
			detalleRepository.actualizaStock(det.getCantidad(), det.getDetallePK().getIdproducto());
			detalleRepository.save(det);
		}
		
		return obj;
	}

	@Override
	public List<Pedido> listaPedido() {
		return pedidoRepository.findAll();
	}

	@Override
	public List<Pedido> listaPedidoByCliente(int usu) {
		return pedidoRepository.listaPedidoByCliente(usu);
	}

	@Override
	public List<Pedido> listaPedidoByEstado(String estado) {
		return pedidoRepository.listaPedidoByEstado(estado);
	}

	@Override
	public Pedido updateEstadoPedido(Pedido bean) {
		return pedidoRepository.actualizaEstadoPedido(bean.getEstado(), bean.getIdpedido());
	}

	@Override
	public List<DetallePedido> buscaDetallePedidoById(int id) {
		return detalleRepository.buscaDetallePedidoById(id);
	}

}
