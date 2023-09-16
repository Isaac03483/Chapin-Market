package com.yamada.chapinmarketapi.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "cash_registers", schema = "schema_branch_offices")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="id")
public class CashRegister {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;
}
