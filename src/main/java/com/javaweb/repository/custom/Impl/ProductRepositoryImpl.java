package com.javaweb.repository.custom.Impl;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import com.javaweb.builder.ProductSearchBuilder;
import com.javaweb.entity.ProductEntity;
import com.javaweb.repository.ProductRepositoryCustom;

@Repository
public class ProductRepositoryImpl implements ProductRepositoryCustom{
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<ProductEntity> findAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM product ";
		Query query = entityManager.createNativeQuery(sql, ProductEntity.class); 
		return query.getResultList();
	}
	
	public static void QueryNormal(ProductSearchBuilder productSearchBuilder, StringBuilder where) {
		try {
			Field[] fields = ProductSearchBuilder.class.getDeclaredFields();
			for (Field item : fields) {
				item.setAccessible(true);
				String fieldName = item.getName();
				Object value = item.get(productSearchBuilder);
				if (item.getType().getName().equals("java.lang.String") && !value.equals(""))
				    where.append(" AND p."+fieldName+" LIKE '%"+value+"%' ");
//				if (!fieldName.equals("staffId") && !fieldName.equals("typeCode") && !fieldName.startsWith("rentArea")
//						&& !fieldName.startsWith("rentPrice")) {
//					Object value = item.get(buildingSearchBuilder);
//					if (value != null) {
//						if (item.getType().getName().equals("java.lang.Long")
//								|| item.getType().getName().equals("java.lang.Integer")) {
//							where.append(" AND b." + fieldName + " = " + value);
//						} else if (item.getType().getName().equals("java.lang.String") && !value.equals("")) {
//							where.append(" AND b." + fieldName + " LIKE '%" + value + "%' ");
//						}
//					}
//				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public List<ProductEntity> findAll(ProductSearchBuilder productSearchBuilder) {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder("SELECT * FROM product p ");
		StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");
		QueryNormal(productSearchBuilder, where);
		sql.append(where);
		Query query = entityManager.createNativeQuery(sql.toString(), ProductEntity.class);
		return query.getResultList();
	}


}
