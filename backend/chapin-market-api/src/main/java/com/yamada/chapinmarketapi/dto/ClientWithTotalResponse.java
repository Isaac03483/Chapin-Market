package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.ClientWithTotal;

import java.math.BigDecimal;

public record ClientWithTotalResponse(ClientResponse client, BigDecimal total) {

    public ClientWithTotalResponse(ClientWithTotal clientWithTotal) {
        this(new ClientResponse(clientWithTotal.getClient()), clientWithTotal.getTotal());
    }
}
