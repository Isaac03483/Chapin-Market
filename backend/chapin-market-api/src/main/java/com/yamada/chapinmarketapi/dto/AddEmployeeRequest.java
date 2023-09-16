package com.yamada.chapinmarketapi.dto;

public record AddEmployeeRequest(String employeeName, String employeePassword, BranchOfficeRequest branchOffice, EmployeeTypeRequest employeeType) {
}
