package com.yamada.chapinmarketapi.dto;


import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.util.List;


public record BillRequest(
        @NotBlank String clientNit,
        @NotNull Long employeeId,
        @NotNull Long branchOfficeId,
        @NotNull List<Long> products,
        @NotNull Boolean usePoints) {

    @Override
    public String toString() {
        return "BillRequest{" +
                "clientNit='" + clientNit + '\'' +
                ", employeeId=" + employeeId +
                ", branchOfficeId=" + branchOfficeId +
                ", products=" + products +
                ", usePoints=" + usePoints +
                '}';
    }
}
