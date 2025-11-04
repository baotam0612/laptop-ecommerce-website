package com.javaweb.controller.admin;

import com.javaweb.entity.OrderEntity;
import com.javaweb.service.Impl.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/checkout")
    public Map<String, Object> checkout(HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName();

        OrderEntity order = orderService.checkout(session, userName);

        if (order == null) {
            response.put("status", "empty_cart");
        } else {
            response.put("status", "success");
            response.put("orderId", order.getId());
        }
        return response;
    }
}