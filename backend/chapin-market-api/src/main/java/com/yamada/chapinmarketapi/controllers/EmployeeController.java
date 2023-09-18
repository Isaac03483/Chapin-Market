package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.AddEmployeeRequest;
import com.yamada.chapinmarketapi.dto.EmployeeResponse;
import com.yamada.chapinmarketapi.models.Employee;
import com.yamada.chapinmarketapi.services.EmployeeService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/chapin-market/employees")
@AllArgsConstructor
public class EmployeeController {

    private final EmployeeService employeeService;

    @PostMapping
    public ResponseEntity<EmployeeResponse> addEmployee(@RequestBody AddEmployeeRequest addEmployeeRequest) {
        Employee employee = employeeService.addEmployee(addEmployeeRequest);
        return ResponseEntity.ok(new EmployeeResponse(employee));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Page<EmployeeResponse>> getAllEmployeesByBranchOffice(@PageableDefault(size = 5) Pageable pageable,
                                                                                @PathVariable Long id) {
        Page<EmployeeResponse> allEmployeesByBranchOffice = employeeService.getAllEmployeesByBranchOffice(pageable, id);
        return ResponseEntity.ok(allEmployeesByBranchOffice);
    }
}
