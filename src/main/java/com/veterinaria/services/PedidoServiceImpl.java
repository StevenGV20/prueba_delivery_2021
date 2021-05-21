package com.veterinaria.services;


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

}
