package com.yamada.chapinmarketapi.models;

import com.yamada.chapinmarketapi.dto.CardTypeDTO;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Entity
@Table(name = "cards_types", schema = "schema_clients")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "cardTypeId")
public class CardType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JoinColumn(name = "card_type_id")
    private Long cardTypeId;

    private String cardName;
    private Integer pointsPerReq;
    private BigDecimal requirements;
    private BigDecimal minSpent;

    public void update(CardTypeDTO cardTypeDTO) {
        if(cardTypeDTO.pointsPerReq() != null) {
            this.pointsPerReq = cardTypeDTO.pointsPerReq();
        }

        if(cardTypeDTO.requirements() != null) {
            this.requirements = cardTypeDTO.requirements();
        }

        if(cardTypeDTO.minSpent() != null) {
            this.minSpent = cardTypeDTO.minSpent();
        }
    }
}
