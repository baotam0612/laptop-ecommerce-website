package com.javaweb.repository;

import com.javaweb.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long>{
     UserEntity findIdByUserName(String username);

    UserEntity findOneByUserNameAndEnabled(String userName, int enabled);

    UserEntity findByEmail(String email);

    List<UserEntity> findAll();
    Optional<UserEntity> findById(Long id);
}
