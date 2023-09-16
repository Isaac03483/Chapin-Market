package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.EmployeeType;

public record EmployeeTypeResponse(String employeeTypeName) {
    public EmployeeTypeResponse(EmployeeType employeeType) {
        this(employeeType.getNameType());
    }
}
