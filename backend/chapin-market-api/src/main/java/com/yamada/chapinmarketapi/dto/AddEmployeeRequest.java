package com.yamada.chapinmarketapi.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record AddEmployeeRequest(
        @NotBlank String employeeName,
        @NotBlank String userName,
        @NotBlank String employeePassword,
        @NotNull @Valid BranchOfficeRequest branchOffice,
        @NotNull @Valid EmployeeTypeRequest employeeType) {
}
