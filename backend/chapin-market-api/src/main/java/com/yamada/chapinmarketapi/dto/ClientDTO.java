package com.yamada.chapinmarketapi.dto;

import com.yamada.chapinmarketapi.models.Client;
import jakarta.validation.constraints.NotBlank;

public record ClientDTO(@NotBlank String nit, @NotBlank String clientName) {

    public ClientDTO(Client clientSaved) {
        this(clientSaved.getNit(), clientSaved.getClientName());
    }
}
