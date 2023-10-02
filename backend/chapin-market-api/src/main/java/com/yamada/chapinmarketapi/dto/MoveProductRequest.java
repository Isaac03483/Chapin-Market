package com.yamada.chapinmarketapi.dto;

import jakarta.validation.constraints.NotNull;

public record MoveProductRequest(@NotNull Long productId,@NotNull Long branchOfficeId) {
}
