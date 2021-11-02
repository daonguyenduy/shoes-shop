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
public class AddProductError {

    private String productIDError, productNameError, descriptionError, quantityError, priceError, statusError;

    public AddProductError() {
    }

    public AddProductError(String productIDError, String productNameError, String descriptionError, String quantityError, String priceError, String statusError) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.descriptionError = descriptionError;
        this.quantityError = quantityError;
        this.priceError = priceError;
        this.statusError = statusError;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getDescriptionError() {
        return descriptionError;
    }

    public void setDescriptionError(String descriptionError) {
        this.descriptionError = descriptionError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

}
