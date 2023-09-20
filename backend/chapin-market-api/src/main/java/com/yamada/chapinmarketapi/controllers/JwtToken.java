package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.EmployeeResponse;

public record JwtToken(EmployeeResponse employeeResponse, String jwt) {
}
