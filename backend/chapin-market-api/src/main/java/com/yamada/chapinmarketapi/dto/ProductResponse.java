package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.Product;
import com.yamada.chapinmarketapi.models.ProductState;

import java.math.BigDecimal;

public record ProductResponse(
        Long productId,
        String productName,
        ProductState productState,
        BranchOfficeResponse branchOffice,
        String brand,
        BigDecimal price) {
    public ProductResponse(Product product) {
        this(product.getProductId(),
                product.getProductName(),
                product.getProductState(),
                new BranchOfficeResponse(product.getBranchOffice()),
                product.getBrand(),
                product.getPrice());
    }
}
