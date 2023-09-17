package com.yamada.chapinmarketapi.services;

import com.yamada.chapinmarketapi.dto.AddEmployeeRequest;
import com.yamada.chapinmarketapi.dto.EmployeeListResponse;
import com.yamada.chapinmarketapi.dto.EmployeeTypeResponse;
import com.yamada.chapinmarketapi.models.BranchOffice;
import com.yamada.chapinmarketapi.models.Employee;
import com.yamada.chapinmarketapi.repositories.EmployeeRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class EmployeeService {

    private final EmployeeRepository employeeRepository;

    public Employee addEmployee(AddEmployeeRequest addEmployeeRequest) {
        Employee employee = new Employee(addEmployeeRequest);
        return employeeRepository.save(employee);
    }

    public Page<EmployeeListResponse> getAllEmployeesByBranchOffice(Pageable pageable, Long id) {
        BranchOffice branchOffice = new BranchOffice();
        branchOffice.setBranchOfficeId(id);
        Page<Employee> employees = employeeRepository.findAllByBranchOffice(pageable, branchOffice);
        return employees.map(EmployeeListResponse::new);
    }
}
