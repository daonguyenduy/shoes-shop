/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group2.product;

/**
 *
 * @author daong
 */
public class ProductDTO {
    private String productID,productName,description,status,image,categoryID;
    private float price;
    private int quantity;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String productName, String description, String status, String image, String categoryID, float price, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.status = status;
        this.image = image;
        this.categoryID = categoryID;
        this.price = price;
        this.quantity = quantity;
    }

    public ProductDTO(String productID, String productName, String description, String status, String image) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.status = status;
        this.image = image;
    }

    public ProductDTO(String productID, String productName, String description) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
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
    
}
