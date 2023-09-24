package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.dto.EmployeeResponse;

public record JwtToken(EmployeeResponse employeeResponse, String jwt) {
}
