package com.javaweb.service;

import com.javaweb.model.dto.ProductDTO;
import com.javaweb.model.request.ProductSearchRequest;
import com.javaweb.model.response.ProductSearchResponse;

import java.util.List;


public interface ProductService {
    List<ProductSearchResponse> findAll(ProductSearchRequest productRequest);
    List<ProductDTO> findAll();

    ProductDTO addOrUpdateProduct(ProductDTO productDTO);
    ProductDTO findNameById(Long Id);
    void deleteProductById(Long Id);
}
