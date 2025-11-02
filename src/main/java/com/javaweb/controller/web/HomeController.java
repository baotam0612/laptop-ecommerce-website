package com.javaweb.controller.web;

import com.javaweb.entity.ProductEntity;
import com.javaweb.model.dto.ProductDTO;
import com.javaweb.repository.ProductRepository;
import com.javaweb.repository.custom.Impl.ProductRepositoryImpl;
import com.javaweb.service.Impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller(value = "homeController")
public class HomeController {
	
	@Autowired
	private ProductRepositoryImpl productRepository;
    @Autowired
    private ProductRepository productRepositoryInterface;

    @Autowired
    private ProductServiceImpl productServiceImpl;


    @GetMapping(value = "/trang-chu")
    public ModelAndView homePage(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("web/home");
        List<ProductEntity> res = productRepository.findAll();
        mav.addObject("products", res);
        return mav;
    }

    @GetMapping(value="/gioi-thieu")
    public ModelAndView introducePage(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("web/introduce");
        return mav;
    }

    @GetMapping(value="/san-pham")
    public ModelAndView productPage(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("web/product");
        List<ProductDTO> liProductDTO = productServiceImpl.findAll();
        mav.addObject("liProducts", liProductDTO);
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

    @GetMapping(value="/product/item-{id}")
    public ModelAndView itemPage(@PathVariable("id") Long Id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/web/item");
        Optional<ProductEntity> optionalProduct = productRepositoryInterface.findById(Id);

        ProductEntity pe = optionalProduct.get();
        mav.addObject("item", pe);
        return mav;
    }
	
}
