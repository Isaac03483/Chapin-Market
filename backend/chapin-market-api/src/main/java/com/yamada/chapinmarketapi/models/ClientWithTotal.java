package com.yamada.chapinmarketapi.models;

import lombok.*;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "client")
public class ClientWithTotal {

    private Client client;
    private BigDecimal total;
}
