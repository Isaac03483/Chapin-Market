package com.yamada.chapinmarketapi.services;

import com.yamada.chapinmarketapi.dto.EmployeeTypeResponse;
import com.yamada.chapinmarketapi.repositories.EmployeeTypeRespository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class EmployeeTypeService {

    private final EmployeeTypeRespository employeeTypeRespository;

    public List<EmployeeTypeResponse> getAllEmployeesTypes() {
        return employeeTypeRespository.findAll().stream().map(EmployeeTypeResponse::new).toList();
    }
}
