package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.Client;

public record ClientResponse(String nit, String clientName, ClientCardResponse clientCard) {
    public ClientResponse(Client client) {
        this(client.getNit(), client.getClientName(),
                client.getClientCard() != null ? new ClientCardResponse(client.getClientCard()) : null
        );
    }
}
