/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group2.detail;

import group2.product.ProductDTO;



/**
 *
 * @author daong
 */
public class DetailDTO {
     private int detailID;
    private int orderID;
    private float price;
    private int quantity;
    private ProductDTO product;

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public DetailDTO(int detailID, int orderID, float price, int quantity, ProductDTO product) {
        this.detailID = detailID;
        this.orderID = orderID;
        this.price = price;
        this.quantity = quantity;
        this.product = product;
    }

    public DetailDTO() {
    }

    
}
