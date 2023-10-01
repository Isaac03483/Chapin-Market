package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.CardType;

import java.math.BigDecimal;

public record CardTypeDTO(Long id, String cardName, Integer pointsPerReq, BigDecimal requirements, BigDecimal minSpent) {

    public CardTypeDTO(CardType cardType) {
        this(cardType.getCardTypeId(), cardType.getCardName(), cardType.getPointsPerReq(), cardType.getRequirements(),
                cardType.getMinSpent());
    }

    @Override
    public String toString() {
        return "CardTypeDTO{" +
                "id=" + id +
                ", cardName='" + cardName + '\'' +
                ", pointsPerReq=" + pointsPerReq +
                ", requirements=" + requirements +
                ", minSpent=" + minSpent +
                '}';
    }
}
