package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.AddEmployeeRequest;
import com.yamada.chapinmarketapi.dto.EmployeeResponse;
import com.yamada.chapinmarketapi.exceptions.UserNotFoundException;
import com.yamada.chapinmarketapi.models.Employee;
import com.yamada.chapinmarketapi.services.EmployeeService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/chapin-market/employees")
@AllArgsConstructor
public class EmployeeController {

    private final EmployeeService employeeService;

    @GetMapping("/{id}")
    public ResponseEntity<EmployeeResponse> getEmployeeById(@PathVariable Long id) {
        Optional<Employee> optionalEmployee = employeeService.getEmployeeById(id);
        if (optionalEmployee.isEmpty()) {
            throw new UserNotFoundException("User not found");
        }

        return ResponseEntity.ok(new EmployeeResponse(optionalEmployee.get()));
    }

    @PostMapping
    public ResponseEntity<EmployeeResponse> addEmployee(@RequestBody AddEmployeeRequest addEmployeeRequest) {
        Employee employee = employeeService.addEmployee(addEmployeeRequest);
        return ResponseEntity.ok(new EmployeeResponse(employee));
    }

    @GetMapping("/branch-office/{id}")
    public ResponseEntity<Page<EmployeeResponse>> getAllEmployeesByBranchOffice(@PageableDefault(size = 15) Pageable pageable,
                                                                                @PathVariable Long id) {
        Page<EmployeeResponse> allEmployeesByBranchOffice = employeeService.getAllEmployeesByBranchOffice(pageable, id);
        return ResponseEntity.ok(allEmployeesByBranchOffice);
    }
}
