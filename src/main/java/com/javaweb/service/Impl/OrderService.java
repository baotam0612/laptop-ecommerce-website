package com.javaweb.service.Impl;

import com.javaweb.entity.CartItem;
import com.javaweb.entity.OrderDetailEntity;
import com.javaweb.entity.OrderEntity;
import com.javaweb.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    public OrderEntity createOrder(Long customerId, List<CartItem> cartItems) {
        if (cartItems == null || cartItems.isEmpty()) {
            throw new IllegalArgumentException("Cart is empty");
        }

        OrderEntity order = new OrderEntity();
        order.setCustomerId(customerId.toString());
        order.setDate(new Date());
        order.setStatus("Pending");

        long totalAmount = 0;
        List<OrderDetailEntity> details = new ArrayList<>();

        for (CartItem item : cartItems) {
            OrderDetailEntity detail = new OrderDetailEntity();
            detail.setOrderEntity(order);
            detail.setProductEntity(item.getProduct());
            detail.setQuantity(item.getQuantity());
            detail.setPrice((long) item.getPrice());
            details.add(detail);
            totalAmount += (long) item.getPrice() * item.getQuantity();
        }

        order.setTotalAmount(totalAmount);
        order.setOrderDetailEntityList(details);



        return orderRepository.save(order);
    }
}
