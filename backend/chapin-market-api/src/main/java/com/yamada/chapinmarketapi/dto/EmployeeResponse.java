package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.Employee;

public record EmployeeResponse(Long id, String employeeName, EmployeeTypeResponse employeeType, BranchOfficeResponse branchOffice) {

    public EmployeeResponse(Employee employee) {
        this(employee.getEmployeeId(), employee.getEmployeeName(), new EmployeeTypeResponse(employee.getEmployeeType()), new BranchOfficeResponse(employee.getBranchOffice()));
    }
}
