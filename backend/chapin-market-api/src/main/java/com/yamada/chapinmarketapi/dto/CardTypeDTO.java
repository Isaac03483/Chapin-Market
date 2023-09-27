package com.yamada.chapinmarketapi.dto;

import java.math.BigDecimal;

public record CardTypeRequest(String cardName, Long pointsPerReq, BigDecimal requirements, BigDecimal minSpent) {
}
