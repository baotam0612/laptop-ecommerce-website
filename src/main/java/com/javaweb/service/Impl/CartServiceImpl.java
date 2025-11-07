package com.javaweb.service.Impl;

import com.javaweb.entity.ProductEntity;
import com.javaweb.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;

@Service
public class CartServiceImpl {

    private static final String CART_SESSION_KEY = "cart";

    @Autowired
    private ProductRepository productRepository;


    public void addToCart(Long productId, int quantity, HttpSession session) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute(CART_SESSION_KEY);
        if (cart == null) {
            cart = new HashMap<>();
        }

        cart.put(productId, cart.getOrDefault(productId, 0) + quantity);
        session.setAttribute(CART_SESSION_KEY, cart);
    }

    @SuppressWarnings("unchecked")
    // thành phần giỏ hàng
    public List<Map<String, Object>> getCartItems(HttpSession session) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) return Collections.emptyList();;

        List<Map<String, Object>> items = new ArrayList<>();

        for (Map.Entry<Long, Integer> entry : cart.entrySet()) {
            ProductEntity product = productRepository.findById(entry.getKey()).orElse(null);
            if (product != null) {
                Map<String, Object> item = new HashMap<>();

                item.put("id", product.getId());
                item.put("name", product.getName());

                // Xu ly gia tien
                String priceString = product.getPrice();
                priceString = priceString.replace(".", "").replace(",", ".");
                BigDecimal price = new BigDecimal(priceString);

                int quantity = entry.getValue();
                BigDecimal total = price.multiply(BigDecimal.valueOf(quantity));

                item.put("price", price);
                item.put("quantity", quantity);
                item.put("total", total);
                item.put("image", product.getImagespath());

                items.add(item);
            }
        }
        return items;
    }

    @SuppressWarnings("unchecked")
    // xóa ở giỏ hàng
    public void removeFromCart(Long productId, HttpSession session) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute(CART_SESSION_KEY);
        if (cart != null) {
            cart.remove(productId);
            session.setAttribute(CART_SESSION_KEY, cart);
        }
    }

    // Chuyển từ dẹmcal(db) về long(reponse giao diện)
    public long getTotal(HttpSession session) {
        return getCartItems(session).stream()
                .map(i -> (BigDecimal) i.get("total"))
                .reduce(BigDecimal.ZERO, BigDecimal::add)
                .longValue();
    }

    // số lượng
    public int getCartCount(HttpSession session) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute(CART_SESSION_KEY);
        if (cart == null) return 0;
        return cart.values().stream().mapToInt(Integer::intValue).sum();
    }
}
