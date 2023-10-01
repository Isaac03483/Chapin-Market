package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.Bill;

import java.math.BigDecimal;

public record BillResponse(Long billId, BigDecimal subTotal, BigDecimal discount, BigDecimal total) {
    public BillResponse(Bill bill) {
        this(bill.getBillId(), bill.getSubTotal(), bill.getDiscount(), bill.getTotal());
    }
}
