package com.javaweb.repository;

import com.javaweb.entity.PasswordResetEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetEntity,Long> {
}
