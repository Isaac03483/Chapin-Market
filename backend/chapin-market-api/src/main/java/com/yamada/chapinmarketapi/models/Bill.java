package com.yamada.chapinmarketapi.models;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "bills", schema = "schema_sales")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "billId")
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long billId;
    private LocalDate billDate = LocalDate.now();

    @ManyToOne
    private Client client;

    @OneToOne
    private Employee employee;

    @ManyToOne
    private BranchOffice branchOffice;
    private BigDecimal totalWithoutDiscount;
    private BigDecimal totalWithDiscount;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "bill")
    private List<SaleDetail> saleDetails;

}
