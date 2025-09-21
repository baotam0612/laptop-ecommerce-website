package com.javaweb.repository;

import java.util.List;

import com.javaweb.builder.ProductSearchBuilder;
import com.javaweb.entity.ProductEntity;

public interface ProductRepositoryCustom {
	List<ProductEntity> findAll();
	List<ProductEntity> findAll(ProductSearchBuilder productSearchBuilder);
}
