package com.javaweb.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.javaweb.model.request.ProductSearchRequest;
import com.javaweb.model.response.ProductSearchResponse;
import com.javaweb.service.ProductService;

@Controller(value="productControllerOfAdmin")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping(value="/admin/product-list")
	public ModelAndView ProductList(@ModelAttribute ProductSearchRequest productRequest, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/admin/product-list");
		// tra ra du lieu jsp sau khi nhap tren view
		mav.addObject("modelSearch", productRequest);
		List<ProductSearchResponse> lists = productService.findAll(productRequest);
		ProductSearchResponse productSearchResponse = new ProductSearchResponse();
		productSearchResponse.setListResult(lists);
		mav.addObject("productList", productSearchResponse);
		return mav;
	}

}
