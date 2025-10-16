package com.javaweb.api;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.javaweb.model.dto.ProductDTO;
import com.javaweb.service.ProductService;

import java.util.HashMap;
import java.util.Map;

@RestController(value="buildingAPIOfAdmin")
@RequestMapping(value="/api/product")
@Transactional
public class ProductAPI {
    @Autowired
    public ProductService productService;

    @PostMapping
    public ResponseEntity<ProductDTO> AddOrUpdateProduct(@RequestBody ProductDTO productDTO) {
        return ResponseEntity.ok(productService.addOrUpdateProduct(productDTO));
    }

    @PostMapping("/remove")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> removeFromCart(@RequestBody Map<String, Object> data, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            Long productId = Long.valueOf(data.get("productId").toString());

            productService.deleteProductById(productId);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
}
