package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.entity.UserEntity;
import com.javaweb.repository.custom.UserRepositoryCustom;

public interface UserRepository extends JpaRepository<UserEntity, Long>, UserRepositoryCustom{
	UserEntity findOneByUserNameAndEnabled(String name, int enabled);

}
