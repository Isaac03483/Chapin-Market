package com.yamada.chapinmarketapi.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public record AddProductRequest(
        @NotBlank String productName,
        @NotNull BranchOfficeRequest branchOffice,
        @NotBlank String brand,
        @NotNull BigDecimal price) {
}
