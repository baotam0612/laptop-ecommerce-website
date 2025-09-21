package com.javaweb.service;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.javaweb.model.request.ProductSearchRequest;
import com.javaweb.model.response.ProductSearchResponse;


public interface ProductService {
	List<ProductSearchResponse> findAll(ProductSearchRequest productRequest);
}
