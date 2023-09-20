package com.yamada.chapinmarketapi.services;

import com.yamada.chapinmarketapi.dto.AddEmployeeRequest;
import com.yamada.chapinmarketapi.dto.EmployeeResponse;
import com.yamada.chapinmarketapi.models.BranchOffice;
import com.yamada.chapinmarketapi.models.Employee;
import com.yamada.chapinmarketapi.repositories.EmployeeRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@AllArgsConstructor
public class EmployeeService {

    private final EmployeeRepository employeeRepository;
    private final PasswordEncoder passwordEncoder;

    public Employee addEmployee(AddEmployeeRequest addEmployeeRequest) {
        Employee employee = new Employee(addEmployeeRequest);
        employee.setEmployeePassword(passwordEncoder.encode(employee.getPassword()));
        return employeeRepository.save(employee);
    }

    public Page<EmployeeResponse> getAllEmployeesByBranchOffice(Pageable pageable, Long id) {
        BranchOffice branchOffice = new BranchOffice();
        branchOffice.setBranchOfficeId(id);
        Page<Employee> employees = employeeRepository.findAllByBranchOffice(pageable, branchOffice);
        return employees.map(EmployeeResponse::new);
    }

    public Optional<Employee> getEmployeeById(Long id) {
        return this.employeeRepository.findById(id);
    }
}
