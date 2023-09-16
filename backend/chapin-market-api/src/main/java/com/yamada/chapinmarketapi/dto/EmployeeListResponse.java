package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.Employee;

public record EmployeeListResponse(Long id, String employeeName, EmployeeTypeResponse employeeType, BranchOfficeResponse branchOffice) {

    public EmployeeListResponse(Employee employee) {
        this(employee.getEmployeeId(), employee.getEmployeeName(), new EmployeeTypeResponse(employee.getEmployeeType()), new BranchOfficeResponse(employee.getBranchOffice()));
    }
}
