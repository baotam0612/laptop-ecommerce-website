package com.javaweb.api;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.javaweb.model.dto.ProductDTO;
import com.javaweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.Map;

@RestController(value="buildingAPIOfAdmin")
@RequestMapping(value="/api/product")
@Transactional
public class ProductAPI {
    @Autowired
    public ProductService productService;

    @Autowired
    public Cloudinary cloudinary;


    @PostMapping
    public ResponseEntity<ProductDTO> AddOrUpdateProduct(@RequestBody ProductDTO productDTO) {
        return ResponseEntity.ok(productService.addOrUpdateProduct(productDTO));
    }

    // up anh len cloud
    @PostMapping("/upload-image")
    public ResponseEntity<Map<String, Object>> uploadImage(@RequestParam("imageFile") MultipartFile file) {
        Map<String, Object> response = new HashMap<>();
        try {
            Map uploadResult = cloudinary.uploader().upload(
                    file.getBytes(),
                    ObjectUtils.asMap("folder", "products")
            );
            String imageUrl = (String) uploadResult.get("secure_url");

            response.put("status", "success");
            response.put("imageUrl", imageUrl);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
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
