package com.javaweb.service.Impl;

import com.javaweb.converter.UserConverter;
import com.javaweb.entity.PasswordResetEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.repository.PasswordResetTokenRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.UUID;


@Service
public class UserService implements IUserService{
	
	 @Autowired
	  private UserRepository userRepository;

	@Autowired
	private UserConverter userConverter;

    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private PasswordResetTokenRepository tokenRepository;
	
	@Override
	public UserDTO findOneByUserNameAndEnable(String userName, int enabled) {
		 return userConverter.convertToDto(userRepository.findOneByUserNameAndEnabled(userName, enabled));	  
	}


    public void sendPasswordResetLink(String email) {
        UserEntity user = userRepository.findByEmail(email);
        if (user == null) {
            throw new RuntimeException("Không tìm thấy email");
        }

        String token = UUID.randomUUID().toString();
        PasswordResetEntity resetToken = new PasswordResetEntity();
        resetToken.setToken(token);
        resetToken.setUser(user);
        resetToken.setExpiryDate(LocalDateTime.now().plusMinutes(15));
        tokenRepository.save(resetToken);

        String link = "http://localhost:8081/reset-password?token=" + token;

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Khôi phục mật khẩu");
        message.setText("Nhấn vào liên kết để đặt lại mật khẩu: " + link);
        mailSender.send(message);
    }

	
	

}
