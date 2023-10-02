package com.yamada.chapinmarketapi.dto;

import jakarta.validation.constraints.NotNull;

public record EmployeeTypeRequest(@NotNull Long employeeTypeId) {
}
