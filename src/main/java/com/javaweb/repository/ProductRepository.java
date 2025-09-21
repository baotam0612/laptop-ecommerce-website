package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.entity.ProductEntity;



public interface ProductRepository extends JpaRepository<ProductEntity,Long>{
	
}
