package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.Employee;

public record EmployeeResponse(Long id, String employeeName, String userName, EmployeeTypeResponse employeeType, BranchOfficeResponse branchOffice) {

    public EmployeeResponse(Employee employee) {
        this(employee.getEmployeeId(), employee.getEmployeeName(), employee.getUsername(), new EmployeeTypeResponse(employee.getEmployeeType()), new BranchOfficeResponse(employee.getBranchOffice()));
    }
}
