package com.yamada.chapinmarketapi.models;

import com.yamada.chapinmarketapi.dto.AddEmployeeRequest;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "employees", schema = "schema_staff")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "employeeId")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long employeeId;
    private String employeeName;
    private String employeePassword;

    @ManyToOne
    @JoinColumn(name = "branch_office_id")
    private BranchOffice branchOffice;

    @OneToOne
    @JoinColumn(name = "employee_type")
    private EmployeeType employeeType;

    @OneToOne
    @JoinColumn(name = "employee_id")
    private CashRegister cashRegister;

    public Employee(AddEmployeeRequest addEmployeeRequest) {
        this.employeeName = addEmployeeRequest.employeeName();
        this.employeePassword = addEmployeeRequest.employeePassword();
        this.branchOffice = new BranchOffice(addEmployeeRequest.branchOffice());
        this.employeeType = new EmployeeType(addEmployeeRequest.employeeType());
    }
}
