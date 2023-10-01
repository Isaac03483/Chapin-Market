package com.yamada.chapinmarketapi.dto;

import java.math.BigDecimal;

public record BranchOfficeReport(BranchOfficeResponse branchOffice, BigDecimal total) {
}
