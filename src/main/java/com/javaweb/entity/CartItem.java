package com.javaweb.entity;

import java.io.Serializable;
import com.javaweb.entity.ProductEntity;

public class CartItem implements Serializable {
    private ProductEntity product;

    private Long productId;
    private String name;
    private String image;
    private double price;
    private int quantity;

    public CartItem(Long productId, String name, String image, double price, int quantity) {
        this.productId = productId;
        this.name = name;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        int l = product.getPrice().length();
        return  (Double.parseDouble(product.getPrice().substring(0,l-3)) * quantity);
    }
}
