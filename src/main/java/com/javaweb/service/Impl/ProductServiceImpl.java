package com.javaweb.service.Impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaweb.builder.ProductSearchBuilder;
import com.javaweb.converter.ProductConverter;
import com.javaweb.converter.ProductSearchBuilderConverter;
import com.javaweb.entity.ProductEntity;
import com.javaweb.model.dto.ProductDTO;
import com.javaweb.model.request.ProductSearchRequest;
import com.javaweb.model.response.ProductSearchResponse;
import com.javaweb.repository.ProductRepository;
import com.javaweb.repository.custom.Impl.ProductRepositoryImpl;
import com.javaweb.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService{
    @Autowired
    public ProductSearchBuilderConverter productSearchBuilderConverter;



    @Autowired
    public ProductConverter productConverter;

    @Autowired
    public ProductRepositoryImpl productRepositoryImpl;

    @Autowired
    public ModelMapper modelMapper;

    @Autowired
    public ProductRepository productRepository;

    @Override
    public List<ProductSearchResponse> findAll(ProductSearchRequest productRequest) {
        ProductSearchBuilder productSearchBuilder = productSearchBuilderConverter.toProductSearchConverter(productRequest);
        List<ProductEntity> lists = productRepositoryImpl.findAll(productSearchBuilder);
        List<ProductSearchResponse> results = new ArrayList<ProductSearchResponse>();
        for(ProductEntity item : lists) {
            results.add(productConverter.toProductSearchResponse(item));
        }
        return results;
    }

    @Override
    @Transactional
    public ProductDTO addOrUpdateProduct(ProductDTO productDTO) {
        // TODO Auto-generated method stub
        ProductEntity productEntity = modelMapper.map(productDTO, ProductEntity.class);
        // update or add
        productRepository.save(productEntity);
        productDTO.setId(productDTO.getId());
        return productDTO;
    }


    @Override
    public ProductDTO findNameById(Long  Id) {
        Optional<ProductEntity> result = productRepository.findById(Id);
        ProductEntity entity = result.get();
        ProductDTO productDTO = modelMapper.map(entity, ProductDTO.class);
        return productDTO;
    }

    @Override
    public void deleteProductById(Long Id) {
        productRepository.deleteById(Id);
    }






}
