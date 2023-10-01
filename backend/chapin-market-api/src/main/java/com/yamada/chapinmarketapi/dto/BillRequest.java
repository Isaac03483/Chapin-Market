package com.yamada.chapinmarketapi.dto;


import java.util.List;


public record BillRequest(String clientNit, Long employeeId, Long branchOfficeId, List<Long> products, Boolean usePoints) {

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
