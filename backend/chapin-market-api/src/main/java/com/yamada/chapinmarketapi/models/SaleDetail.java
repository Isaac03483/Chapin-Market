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
    @JoinColumn(name = "bill_id")
    private Bill bill;

    @OneToOne
    @JoinColumn(name = "product_id")
    private Product product;
    private Integer productAmount;
}
