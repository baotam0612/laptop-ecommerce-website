package com.javaweb.repository.custom.Impl;

import com.javaweb.entity.UserEntity;
import com.javaweb.repository.custom.UserRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;


@Repository
public class UserRepositoryImpl implements UserRepositoryCustom {
	
	@PersistenceContext
	private EntityManager entityManager;

	
	private String buildQueryFilter() {
		String sql = "SELECT * FROM user u WHERE u.status = 1";
		return sql;
	}


	@Override
	public List<UserEntity> findByRole(String roleCode) {
		String sql = "FROM UserEntity";
		Query query = entityManager.createNativeQuery(sql, UserEntity.class);
		return query.getResultList();
	}


}
