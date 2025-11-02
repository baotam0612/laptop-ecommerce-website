package com.javaweb.controller.web;

import com.javaweb.entity.OrderEntity;
import com.javaweb.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@Controller
@RequestMapping("/admin/orders")
public class OrderController {

    @Autowired
    private OrderRepository orderRepository;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("orders", orderRepository.findAll());
        return "admin/orders/list";
    }

    @PostMapping("/update-status")
    @ResponseBody
    public Map<String, String> updateStatus(@RequestParam Long id, @RequestParam String status) {
        OrderEntity order = orderRepository.findById(id).orElse(null);
        order.setStatus(status);
        orderRepository.save(order);
        return null;
    }
}
