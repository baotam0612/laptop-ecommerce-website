package com.javaweb.service.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaweb.builder.ProductSearchBuilder;
import com.javaweb.converter.ProductConverter;
import com.javaweb.converter.ProductSearchBuilderConverter;
import com.javaweb.entity.ProductEntity;
import com.javaweb.model.request.ProductSearchRequest;
import com.javaweb.model.response.ProductSearchResponse;
import com.javaweb.repository.custom.Impl.ProductRepositoryImpl;
import com.javaweb.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	public ProductSearchBuilderConverter productSearchBuilderConverter;
	
	@Autowired
	public ProductConverter productConverter;
	
	@Autowired
	public ProductRepositoryImpl productRepositoryImpl;
	
	@Override
	public List<ProductSearchResponse> findAll(ProductSearchRequest productRequest) {
		ProductSearchBuilder productSearchBuilder = productSearchBuilderConverter.toProductSearchConverter(productRequest);
		List<ProductEntity> lists = productRepositoryImpl.findAll(productSearchBuilder);
		List<ProductSearchResponse> results = new ArrayList<ProductSearchResponse>();
		for(ProductEntity item : lists) {
			results.add(productConverter.toProductSearchResponse(item));
		}
		return results;
	}

	
	
	
}
