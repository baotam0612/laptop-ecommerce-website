package com.javaweb.controller.web;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.ProductEntity;
import com.javaweb.entity.RoleEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.ProductDTO;
import com.javaweb.model.dto.ProductFilterDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.ProductRepository;
import com.javaweb.repository.RoleRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.Impl.ProductRepositoryImpl;
import com.javaweb.service.Impl.ProductServiceImpl;
import com.javaweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller(value = "homeController")
public class HomeController {

    static long parsePrice(String price) {
        if (price == null || price.isEmpty()) return 0L;
        try {
            // Xóa dấu chấm và các ký tự không phải số
            String numeric = price.replaceAll("[^0-9]", "");
            return Long.parseLong(numeric);
        } catch (NumberFormatException e) {
            return 0L;
        }
    }
	
	@Autowired
	private ProductRepositoryImpl productRepository;
    @Autowired
    private ProductRepository productRepositoryInterface;

    @Autowired
    private ProductServiceImpl productServiceImpl;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ProductService productService;

    @Autowired
    private CustomerRepository customerRepository;







    @GetMapping(value = "/trang-chu")
    public ModelAndView homePage(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("web/home");
        //  tìm tất cả sản phẩm trong product
        List<ProductEntity> res = productRepository.findAll();
        mav.addObject("products", res);
        return mav;
    }

    // trang gthieu
    @GetMapping(value="/gioi-thieu")
    public ModelAndView introducePage(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("web/introduce");
        return mav;
    }

    // trang sản phẩm
    @GetMapping("/product")
    public ModelAndView viewProducts() {
        List<ProductDTO> listProduct = productService.findAll();
        ModelAndView mav = new ModelAndView("web/product");
        mav.addObject("liProducts", listProduct);
        mav.addObject("filter", new ProductFilterDTO()); // ✅ thêm dòng này
        return mav;
    }

    // bo loc trang product
    @GetMapping("/product/filter")
    public ModelAndView filterProducts(@ModelAttribute("filter") ProductFilterDTO productFilterDTO) {
        List<ProductDTO> listProduct = productService.findAll();

        // tìm tên sản phẩm
        if (productFilterDTO.getKeyword() != null && !productFilterDTO.getKeyword().trim().isEmpty()) {
            listProduct = listProduct.stream()
                    .filter(p -> p.getName().toLowerCase().contains(productFilterDTO.getKeyword().toLowerCase()))
                    .collect(Collectors.toList());
        }

        // lọc theo loại
        if (productFilterDTO.getCategory() != null && !productFilterDTO.getCategory().trim().isEmpty()) {
            listProduct = listProduct.stream()
                    .filter(p -> p.getCategory() != null && p.getCategory().equalsIgnoreCase(productFilterDTO.getCategory()))
                    .collect(Collectors.toList());
        }

        // sắp xếp
        if (productFilterDTO.getSort() != null && !productFilterDTO.getSort().isEmpty()) {
            if (productFilterDTO.getSort().equals("priceAsc")) {
                listProduct.sort(Comparator.comparingLong(p -> parsePrice(p.getPrice())));
            } else if (productFilterDTO.getSort().equals("priceDesc")) {
                listProduct.sort(Comparator.comparingLong((ProductDTO p) -> parsePrice(p.getPrice())).reversed());
            }
        }





        ModelAndView mav = new ModelAndView("web/product");
        mav.addObject("liProducts", listProduct);
        mav.addObject("filter", productFilterDTO); // để form giữ lại giá trị
        return mav;
    }

    @GetMapping(value="/tin-tuc")
    public ModelAndView newsPage(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("web/news");
        return mav;
    }

    @GetMapping(value="/khuyen-mai")
    public ModelAndView khuyenmaiPage(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("web/KhuyenMai");
        return mav;
    }

	
	@GetMapping(value="/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu");
	}

    @GetMapping("/sign-in")
    public ModelAndView signin() {
        ModelAndView mav = new ModelAndView("signin");
        return mav;

    }

    @Transactional
    @PostMapping("/sign-in")
    public String register(@RequestParam("username") String username,
                           @RequestParam("email") String email,
                           @RequestParam("password") String password,
                           @RequestParam("confirmPassword") String confirmPassword,
                           @RequestParam("fullName") String fullName,
                            @RequestParam("address") String address,
                            @RequestParam("phoneNumber") String phoneNumber,
                            Model model) {

        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Mật khẩu xác nhận không khớp!");
            return "SignIn";
        }

        if (userRepository.findByEmail(email) != null) {
            model.addAttribute("error", "Email đã được sử dụng!");
            return "SignIn";
        }

        //set role = "USER", add user vao DB
        UserEntity user = new UserEntity();
        RoleEntity userRole = roleRepository.findOneByCode("USER");
        user.getRoles().add(userRole);
        user.setUserName(username);
        user.setEmail(email);
        user.setEnabled(1);
        user.setPassWord(passwordEncoder.encode(password));

        CustomerEntity customerEntity = new CustomerEntity();
        customerEntity.setFullName(fullName);
        customerEntity.setAddress(address);
        customerEntity.setPhone(phoneNumber);
        customerEntity.setEmail(email);

        // set cả 2 chiều
        customerEntity.setUser(user);
        user.setCustomer(customerEntity);

        userRepository.save(user);
        // nếu sử dụng sẽ lỗi đồng bộ vì dùng cascade rồi nó sẽ tự build table có quan hệ
//        customerRepository.save(customerEntity);



        model.addAttribute("message", "Đăng ký thành công! Hãy đăng nhập.");
        return "login";
    }


    // trang sản phẩm riêng
    @GetMapping(value="/product/item-{id}")
    public ModelAndView itemPage(@PathVariable("id") Long Id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/web/item");
        Optional<ProductEntity> optionalProduct = productRepositoryInterface.findById(Id);

        ProductEntity pe = optionalProduct.get();
        mav.addObject("item", pe);
        return mav;
    }
	
}
