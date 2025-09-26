package com.javaweb.api;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.javaweb.model.dto.ProductDTO;
import com.javaweb.service.ProductService;

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

}
