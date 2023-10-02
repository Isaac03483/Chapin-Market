package com.yamada.chapinmarketapi.dto;

import jakarta.validation.constraints.NotNull;

public record BranchOfficeRequest(@NotNull Long branchOfficeId) {
}
