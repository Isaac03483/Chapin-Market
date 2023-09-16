package com.yamada.chapinmarketapi.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.math.BigDecimal;

@Entity
@Table(name = "clients_cards", schema = "schema_clients")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "clientNit")
public class ClientCard {

    @Id
//    @Column(name = "client_nit")
    private String clientNit;

    @OneToOne
    private CardType cardType;
    private BigDecimal currentSpent;
}
