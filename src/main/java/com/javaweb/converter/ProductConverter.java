package com.javaweb.converter;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.javaweb.entity.ProductEntity;
import com.javaweb.model.response.ProductSearchResponse;


@Component
public class ProductConverter {
	
	@Autowired
	public ModelMapper modelMapper;
	
	public ProductSearchResponse toProductSearchResponse(ProductEntity productEntity) {
		ProductSearchResponse productSearchResponse = modelMapper.map(productEntity, ProductSearchResponse.class);
		return productSearchResponse;

	}

}
