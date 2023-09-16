package com.yamada.chapinmarketapi.models;

import com.yamada.chapinmarketapi.dto.AddProductRequest;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Entity
@Table(name = "products", schema = "schema_inventory")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "productId")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long productId;
    private String productName;

    @Enumerated(EnumType.STRING)
    private ProductState productState;
    private String brand;

    @ManyToOne
    @JoinColumn(name = "branch_office_id")
    private BranchOffice branchOffice;
    private BigDecimal price;

    public Product(AddProductRequest addProductRequest) {
        this.productName = addProductRequest.productName();
        this.productState = ProductState.BODEGA;
        this.branchOffice = new BranchOffice(addProductRequest.branchOffice());
        this.brand = addProductRequest.brand();
        this.price = addProductRequest.price();
    }
}
