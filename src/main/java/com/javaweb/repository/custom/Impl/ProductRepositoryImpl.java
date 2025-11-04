package com.javaweb.repository.custom.Impl;

import com.javaweb.builder.ProductSearchBuilder;
import com.javaweb.entity.ProductEntity;
import com.javaweb.repository.ProductRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;

@Repository
public class ProductRepositoryImpl implements ProductRepositoryCustom{
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<ProductEntity> findAll() {

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
				if (value != null) {
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
