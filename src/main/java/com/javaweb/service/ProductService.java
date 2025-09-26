package com.javaweb.service;

import java.util.List;

import com.javaweb.model.dto.ProductDTO;
import com.javaweb.model.request.ProductSearchRequest;
import com.javaweb.model.response.ProductSearchResponse;


public interface ProductService {
	List<ProductSearchResponse> findAll(ProductSearchRequest productRequest);
	
	ProductDTO addOrUpdateProduct(ProductDTO productDTO);
}
