package com.yamada.chapinmarketapi.models;

import com.yamada.chapinmarketapi.dto.BranchOfficeRequest;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "branch_offices", schema = "schema_branch_offices")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "branchOfficeId")
public class BranchOffice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long branchOfficeId;
    private String name;
    private String department;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "branchOffice")
    private List<Employee> employees;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "branchOffice")
    private List<Product> products;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "branchOffice")
    private List<Bill> bills;

    public BranchOffice(BranchOfficeRequest branchOfficeRequest) {
        this.branchOfficeId = branchOfficeRequest.branchOfficeId();
    }
}