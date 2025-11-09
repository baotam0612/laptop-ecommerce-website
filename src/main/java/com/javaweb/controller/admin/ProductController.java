package com.javaweb.controller.admin;

import com.javaweb.entity.OrderEntity;
import com.javaweb.entity.RoleEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.ProductDTO;
import com.javaweb.model.request.ProductSearchRequest;
import com.javaweb.model.response.ProductSearchResponse;
import com.javaweb.repository.OrderRepository;
import com.javaweb.repository.RoleRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.Impl.RoleRepositoryImpl;
import com.javaweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="productControllerOfAdmin")
public class ProductController {
	
	@Autowired
	private ProductService productService;

    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private RoleRepositoryImpl roleRepositoryImpl;

    // quan ly san pham
	
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




    @GetMapping(value="/admin/product-edit")
	public ModelAndView ProductEdit(@ModelAttribute("modelEdit") ProductDTO productDTO,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/admin/product-edit");
		return mav;
	}

    @GetMapping(value="/admin/product-edit-{id}")
    public ModelAndView ProductEdit(@PathVariable("id") Long Id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/admin/product-edit");
        // xuong tim Id
        ProductDTO productDTO = productService.findNameById(Id);
        mav.addObject("modelEdit", productDTO);
        return mav;
    }

    // trang quan ly don hang

    @GetMapping("/admin/orders")
    public ModelAndView viewOrders() {
        ModelAndView mav = new ModelAndView("admin/Orders");
        List<OrderEntity> list = orderRepository.findAll();
        mav.addObject("orders", list);
        return mav;
    }

    @GetMapping("/admin/order/approve/{id}")
    public ModelAndView viewApproveOrders(@PathVariable Long id){
        OrderEntity orderEntity = orderRepository.findById(id).orElse(null);
        if(orderEntity!=null){
            orderEntity.setStatus("APPROVED");
            orderRepository.save(orderEntity);
        }
        ModelAndView mav = new ModelAndView("admin/Orders");
        List<OrderEntity> list = orderRepository.findAll();
        mav.addObject("orders", list);
        return mav;
    }

    @GetMapping("/admin/order/cancel/{id}")
    public ModelAndView viewCancelOrders(@PathVariable Long id){
        OrderEntity orderEntity = orderRepository.findById(id).orElse(null);
        if(orderEntity!=null){
            orderEntity.setStatus("CANCELED");
            // khong nen xoa de sau con xem hítory
            orderRepository.save(orderEntity);
        }
        ModelAndView mav = new ModelAndView("admin/Orders");
        List<OrderEntity> list = orderRepository.findAll();
        mav.addObject("orders", list);
        return mav;
    }

    // quan ly tai khoan

    @GetMapping("/admin/users")
    public ModelAndView viewManageUsers(){
        ModelAndView mav = new ModelAndView("admin/user-list");
        List<UserEntity> users = userRepository.findAll();
        mav.addObject("users", users);
        return mav;
    }

    @GetMapping("/admin/users/edit/{id}")
    public ModelAndView editUsers(@PathVariable Long id){
        UserEntity userEntity = userRepository.findById(id).orElse(null);
        List<RoleEntity> roles = roleRepository.findAll();
        ModelAndView mav = new ModelAndView("admin/user-edit");
        mav.addObject("user", userEntity);
        mav.addObject("roles", roles);
        return mav;
    }


    @PostMapping("/admin/users/update")
    public String updateUsers(@RequestParam(required = false, name = "roles") List<Long> roleIds,
                              @RequestParam("id") Long id){
        UserEntity userEntity = userRepository.findById(id).orElse(null);
        if(userEntity!=null){
            List<RoleEntity> roles = new ArrayList<>();
            for(Long it :  roleIds){
                RoleEntity roleEntity = roleRepositoryImpl.findByIdImpl(it);
                roles.add(roleEntity);
            }
            userEntity.setRoles(roles);
            userRepository.save(userEntity);

        }
        return "redirect:/admin/users";
    }

    @GetMapping("admin/users/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userRepository.deleteById(id);
        return "redirect:/admin/users";
    }


}