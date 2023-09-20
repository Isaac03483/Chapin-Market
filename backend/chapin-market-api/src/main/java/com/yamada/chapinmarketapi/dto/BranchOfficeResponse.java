package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.BranchOffice;

public record BranchOfficeResponse(Long id,String branchOfficeName) {
    public BranchOfficeResponse(BranchOffice branchOffice) {
        this(branchOffice.getBranchOfficeId(), branchOffice.getName());
    }
}
