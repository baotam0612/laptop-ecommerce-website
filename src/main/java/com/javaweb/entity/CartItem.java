package com.javaweb.entity;

import java.io.Serializable;

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

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
