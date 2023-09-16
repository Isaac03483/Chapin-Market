package com.yamada.chapinmarketapi.models;

import com.yamada.chapinmarketapi.dto.EmployeeTypeRequest;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "employees_types", schema = "schema_staff")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "typeId")
public class EmployeeType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long typeId;

//    @JoinColumn(name = "name_type")
    private String nameType;

    public EmployeeType(EmployeeTypeRequest employeeTypeRequest) {
        this.typeId = employeeTypeRequest.employeeTypeId();
    }
}
