package com.yamada.chapinmarketapi.dto;

import jakarta.validation.constraints.NotBlank;

public record ClientCardRequest(@NotBlank String clientNit) {
}
