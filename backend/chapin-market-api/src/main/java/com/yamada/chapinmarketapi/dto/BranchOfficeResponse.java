package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.BranchOffice;

public record BranchOfficeResponse(String branchOfficeName) {
    public BranchOfficeResponse(BranchOffice branchOffice) {
        this(branchOffice.getName());
    }
}
