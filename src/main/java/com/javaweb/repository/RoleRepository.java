package com.javaweb.repository;

import com.javaweb.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface RoleRepository extends JpaRepository<RoleEntity, Long>{
	RoleEntity findOneByCode(String code);
    List<RoleEntity> findAll();
    RoleEntity findByIdImpl(Long id);

}
