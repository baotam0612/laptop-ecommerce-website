package com.javaweb.converter;

import org.springframework.stereotype.Component;

import com.javaweb.builder.ProductSearchBuilder;
import com.javaweb.model.request.ProductSearchRequest;
import com.javaweb.utils.MapUtils;

@Component
public class ProductSearchBuilderConverter {
	
	public ProductSearchBuilder toProductSearchConverter(ProductSearchRequest productSearchRequest) {
		ProductSearchBuilder productSearchBuilder = new ProductSearchBuilder.Builder()
				.setName(MapUtils.getObject(productSearchRequest.getName(), String.class))
				.setCategory(MapUtils.getObject(productSearchRequest.getCategory(), String.class))
				.setBrand(MapUtils.getObject(productSearchRequest.getBrand(), String.class))
				.setCpu(MapUtils.getObject(productSearchRequest.getCpu(), String.class))
				.setGpu(MapUtils.getObject(productSearchRequest.getGpu(), String.class))
				.setRom(MapUtils.getObject(productSearchRequest.getRom(), String.class))
				.setRam(MapUtils.getObject(productSearchRequest.getRam(), String.class)).build();
		return productSearchBuilder;
	}
}
