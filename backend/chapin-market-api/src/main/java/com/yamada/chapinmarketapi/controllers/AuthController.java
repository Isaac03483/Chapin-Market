package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.AuthRequest;
import com.yamada.chapinmarketapi.dto.EmployeeResponse;
import com.yamada.chapinmarketapi.dto.JwtToken;
import com.yamada.chapinmarketapi.models.Employee;
import com.yamada.chapinmarketapi.services.TokenService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/chapin-market/login")
@AllArgsConstructor
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final TokenService tokenService;

    @PostMapping
    public ResponseEntity<JwtToken> auth(@RequestBody @Valid AuthRequest authRequest) {
        Authentication authToken = new UsernamePasswordAuthenticationToken(authRequest.username(),
                authRequest.password());

        Authentication authentication = authenticationManager.authenticate(authToken);
        Employee employee = (Employee) authentication.getPrincipal();
        String jwt = tokenService.getToken(employee);

        return ResponseEntity.ok(new JwtToken(new EmployeeResponse(employee),jwt));

    }
}
