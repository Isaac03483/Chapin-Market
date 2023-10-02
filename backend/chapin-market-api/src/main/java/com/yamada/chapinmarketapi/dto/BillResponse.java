package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.Bill;

import java.math.BigDecimal;

public record BillResponse(Long billId, String nit,BigDecimal subTotal, BigDecimal discount, BigDecimal total) {
    public BillResponse(Bill bill) {
        this(bill.getBillId(),  bill.getClient() != null? bill.getClient().getNit() : "CF",bill.getSubTotal(), bill.getDiscount(), bill.getTotal());
    }
}
