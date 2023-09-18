package com.yamada.chapinmarketapi.models;

import com.yamada.chapinmarketapi.dto.AddEmployeeRequest;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@Entity
@Table(name = "employees", schema = "schema_staff")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "employeeId")
public class Employee implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long employeeId;
    private String employeeName;
    private String userName;
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
        this.userName = addEmployeeRequest.userName();
        this.employeePassword = addEmployeeRequest.employeePassword();
        this.branchOffice = new BranchOffice(addEmployeeRequest.branchOffice());
        this.employeeType = new EmployeeType(addEmployeeRequest.employeeType());
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("ROLE_".concat(this.employeeType.getNameType())));
    }

    @Override
    public String getPassword() {
        return this.employeePassword;
    }

    @Override
    public String getUsername() {
        return this.userName;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
