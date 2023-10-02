package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.CardType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public record CardTypeDTO(
        @NotNull Long id,
        @NotBlank String cardName,
        @NotNull Integer pointsPerReq,
        @NotNull BigDecimal requirements,
        @NotNull BigDecimal minSpent) {

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
