package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.ClientCard;

import java.math.BigDecimal;

public record ClientCardResponse(String clientNit, CardTypeDTO cardType, BigDecimal currentSpent, Integer currentPoints) {

    public ClientCardResponse(ClientCard clientCard) {
        this(clientCard.getClientNit(), new CardTypeDTO(clientCard.getCardType()), clientCard.getCurrentSpent(), clientCard.getCurrentPoints());
    }
}
