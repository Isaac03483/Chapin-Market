package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.BranchOfficeWithTotal;

import java.math.BigDecimal;

public record BranchWithTotalResponse(BranchOfficeResponse branchOffice, BigDecimal total) {

    public BranchWithTotalResponse(BranchOfficeWithTotal branchOffice) {
        this(new BranchOfficeResponse(branchOffice.getBranchOffice()), branchOffice.getTotal());
    }
}
