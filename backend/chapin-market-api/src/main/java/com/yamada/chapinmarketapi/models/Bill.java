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
    @JoinColumn(name = "client_nit")
    private Client client;

    @OneToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;

    @ManyToOne
    @JoinColumn(name = "branch_office_id")
    private BranchOffice branchOffice;

    private BigDecimal subTotal;
    private BigDecimal discount;
    private BigDecimal total;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "bill")
    private List<SaleDetail> saleDetails;

}
