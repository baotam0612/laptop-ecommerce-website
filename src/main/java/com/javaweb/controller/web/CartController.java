package com.javaweb.controller.web;

import com.javaweb.repository.ProductRepository;
import com.javaweb.service.Impl.CartServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CartServiceImpl cartService;

    // giao diện phần giỏ hàng
    @GetMapping
    public ModelAndView viewCart(Model model, HttpSession session) {
        ModelAndView mav = new ModelAndView("web/cart");
        // san pham gio hang
        model.addAttribute("cartItems", cartService.getCartItems(session));
        // tổng tiền trả về Long
        model.addAttribute("total", cartService.getTotal(session));
        // số lượng
        model.addAttribute("cartCount", cartService.getCartCount(session));
        return mav;
    }

    // Thêm sản phẩm vào giỏ
    @PostMapping("/add")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addToCart(@RequestBody Map<String, Object> data, HttpSession session) {
        Long productId = Long.valueOf(data.get("productId").toString());
        int quantity = Integer.parseInt(data.get("quantity").toString());

        cartService.addToCart(productId, quantity, session);

        int cartCount = cartService.getCartCount(session);

        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("cartCount", cartCount);

        return ResponseEntity.ok(response);
    }


    // xóa giỏ hàng
    @PostMapping("/remove")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> removeFromCart(@RequestBody Map<String, Object> data, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            Long productId = Long.valueOf(data.get("productId").toString());

            // Xóa sản phẩm khỏi giỏ
            cartService.removeFromCart(productId, session);

            // Lấy lại tổng số lượng và tổng tiền
            int cartCount = cartService.getCartCount(session);
            double total = cartService.getTotal(session);

            response.put("status", "success");
            response.put("cartCount", cartCount);
            response.put("total", String.format("%.2f", total)); // 2 chữ số sau dấu chấm

            return ResponseEntity.ok(response);

        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }






}
