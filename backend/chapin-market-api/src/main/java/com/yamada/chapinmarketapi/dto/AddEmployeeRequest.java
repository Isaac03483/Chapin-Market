package com.yamada.chapinmarketapi.dto;

public record AddEmployeeRequest(String employeeName, String userName, String employeePassword, BranchOfficeRequest branchOffice, EmployeeTypeRequest employeeType) {
}
