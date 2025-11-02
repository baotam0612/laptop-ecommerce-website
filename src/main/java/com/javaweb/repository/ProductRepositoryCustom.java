package com.javaweb.repository;

import com.javaweb.builder.ProductSearchBuilder;
import com.javaweb.entity.ProductEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepositoryCustom {
	List<ProductEntity> findAll();
	List<ProductEntity> findAll(ProductSearchBuilder productSearchBuilder);
}
