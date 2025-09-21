package com.javaweb.repository.custom;

import java.util.List;

import com.javaweb.entity.UserEntity;

public interface UserRepositoryCustom {
	List<UserEntity> findByRole(String roleCode);

}
