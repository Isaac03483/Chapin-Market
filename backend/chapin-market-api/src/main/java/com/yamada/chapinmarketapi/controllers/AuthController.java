package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.AuthRequest;
import com.yamada.chapinmarketapi.models.Employee;
import com.yamada.chapinmarketapi.repositories.EmployeeRepository;
import com.yamada.chapinmarketapi.services.AuthService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/chapin-market/login")
@AllArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping
    public ResponseEntity auth(@RequestBody @Valid AuthRequest authRequest) {
        return authService.auth(authRequest);
    }
}
