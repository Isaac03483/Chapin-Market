package com.yamada.chapinmarketapi.models;

import lombok.*;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "branch")
public class BranchOfficeWithTotal {

    private BranchOffice branch;
    private BigDecimal total;
}
