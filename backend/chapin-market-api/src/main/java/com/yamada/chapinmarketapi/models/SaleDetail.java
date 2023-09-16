package com.yamada.chapinmarketapi.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "sales_details", schema = "schema_sales")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "detailId")
public class SaleDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long detailId;

    @ManyToOne
    private Bill bill;

    @OneToOne
    private Product product;
    private Integer amount;
}
