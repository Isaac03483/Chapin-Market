package com.yamada.chapinmarketapi.services;

import com.yamada.chapinmarketapi.dto.AuthRequest;
import com.yamada.chapinmarketapi.exceptions.UserNotFoundException;
import com.yamada.chapinmarketapi.models.Employee;
import com.yamada.chapinmarketapi.repositories.EmployeeRepository;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class AuthService {

    private final EmployeeRepository employeeRepository;
    public ResponseEntity auth(AuthRequest authRequest) {
        Employee employee = employeeRepository.findByEmployeeName(authRequest.username());

        if (employee == null) {
            throw new UserNotFoundException("User not found in db");
        }

        //TODO: check if password matches

        System.out.println("employee = " + employee.getEmployeeName());
        return ResponseEntity.ok().build();
    }
}
