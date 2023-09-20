package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.EmployeeType;

public record EmployeeTypeResponse(Long id, String employeeTypeName) {
    public EmployeeTypeResponse(EmployeeType employeeType) {
        this(employeeType.getTypeId(), employeeType.getNameType());
    }
}
