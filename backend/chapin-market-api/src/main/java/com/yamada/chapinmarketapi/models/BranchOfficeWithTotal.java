package com.yamada.chapinmarketapi.models;

import lombok.*;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "branchOffice")
public class BranchOfficeWithTotal {

    private BranchOffice branchOffice;
    private BigDecimal total;
}
