package com.javaweb.controller.web;

import com.javaweb.entity.PasswordResetEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.repository.TokenRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.Impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private TokenRepository tokenRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;




    @GetMapping("/forgot-password")
    public String showForgotPasswordPage() {
        return "forgot-password"; // JSP file name
    }

    @PostMapping("/forgot-password")
    public String processForgotPassword(@RequestParam("email") String email, Model model) {
        try {
            userService.sendPasswordResetLink(email);
            model.addAttribute("message", "Đã gửi email đặt lại mật khẩu!");
        } catch (Exception e) {
            model.addAttribute("error", "Email không tồn tại trong hệ thống!");
        }
        return "forgot-password";
    }
    @GetMapping("/reset-password")
    public String showResetPasswordForm(@RequestParam("token") String token, Model model) {
        PasswordResetEntity resetToken = tokenRepository.findByToken(token);

        if (resetToken == null || resetToken.getExpiryDate().isBefore(LocalDateTime.now())) {
            model.addAttribute("error", "Link đặt lại mật khẩu không hợp lệ hoặc đã hết hạn!");
            return "ResetPassword";
        }

        model.addAttribute("token", token);
        return "ResetPassword";
    }

    @PostMapping("/reset-password")
    public String resetPassword(@RequestParam("token") String token,
                                @RequestParam("newPassword") String newPassword,
                                @RequestParam("confirmPassword") String confirmPassword,
                                Model model) {

        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "Mật khẩu xác nhận không khớp!");
            model.addAttribute("token", token);
            return "ResetPassword";
        }

        PasswordResetEntity resetToken = tokenRepository.findByToken(token);
        if (resetToken == null) {
            model.addAttribute("error", "Link đặt lại mật khẩu không hợp lệ!");
            return "ResetPassword";
        }

        if (resetToken.getExpiryDate().isBefore(LocalDateTime.now())) {
            model.addAttribute("error", "Link đặt lại mật khẩu đã hết hạn!");
            tokenRepository.delete(resetToken);
            return "ResetPassword";
        }

        UserEntity user = resetToken.getUser();
        user.setPassWord(passwordEncoder.encode(newPassword));
        userRepository.save(user);
        tokenRepository.delete(resetToken);


        model.addAttribute("message", "Đặt lại mật khẩu thành công! Hãy đăng nhập lại.");
        return "login";
    }




}
