package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.EmployeeTypeResponse;
import com.yamada.chapinmarketapi.models.EmployeeType;
import com.yamada.chapinmarketapi.services.EmployeeTypeService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/chapin-market/employees/types")
@AllArgsConstructor
public class EmployeeTypeController {

    private final EmployeeTypeService employeeTypeService;

    @GetMapping
    public ResponseEntity<List<EmployeeTypeResponse>> getAllEmployeesTypes() {
        List<EmployeeTypeResponse> employeeTypeResponses = employeeTypeService.getAllEmployeesTypes();
        return ResponseEntity.ok(employeeTypeResponses);
    }
}
