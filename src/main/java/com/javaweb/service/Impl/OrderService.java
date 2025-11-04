package com.javaweb.service.Impl;

import com.javaweb.entity.*;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.OrderRepository;
import com.javaweb.repository.ProductRepository;
import com.javaweb.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CustomerRepository customerRepository;


    @Autowired
    private UserRepository userRepository;



    @Transactional
    public OrderEntity checkout(HttpSession session, String userName) {

        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) return null;
        OrderEntity order = new OrderEntity();
        order.setDate(new Date());
        UserEntity user = userRepository.findIdByUserName(userName);
        Long userId = user.getId();
        List<CustomerEntity> customer = customerRepository.findByUserId(userId);
        for(CustomerEntity c : customer){
            order.setCustomer(c);
            order.setStatus("PENDING");
        }


        long total = 0;
        List<OrderDetailEntity> details = new ArrayList<>();

        for (Map.Entry<Long, Integer> entry : cart.entrySet()) {
            Long productId = entry.getKey();
            int quantity = entry.getValue();

            ProductEntity product = productRepository.findById(productId).orElse(null);
            if (product == null) continue;


            String priceStr = product.getPrice().replace(".", "").replace(",", ".");
            BigDecimal price = new BigDecimal(priceStr);

            // chi tiet don hang
            OrderDetailEntity detail = new OrderDetailEntity();
            detail.setProductEntity(product);
            detail.setQuantity(quantity);
            detail.setPrice(price.longValue());
            detail.setOrderEntity(order);

            total += price.longValue() * quantity;
            details.add(detail);
        }

        order.setTotalAmount(total);
        order.setOrderDetailEntityList(details);

        // them don hang
        orderRepository.save(order);

        // xoa gio hang
        session.removeAttribute("cart");

        return order;
    }
}
