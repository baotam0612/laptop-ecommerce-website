package com.javaweb.repository;

import com.javaweb.entity.PasswordResetEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TokenRepository extends JpaRepository<PasswordResetEntity, Long> {
    PasswordResetEntity findByToken(String token);
}
