package com.yamada.chapinmarketapi.services;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.yamada.chapinmarketapi.models.Employee;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;

@Service
public class TokenService {

    @Value("${jwt.secret}")
    private String jwtSecret;
    private final int HOURS = 2;

    public String getToken(Employee employee) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(jwtSecret);
            return JWT.create()
                    .withIssuer("chapin market")
                    .withSubject(employee.getEmployeeName())
                    .withClaim("id", employee.getEmployeeId())
                    .withClaim("BranchOfficeId", employee.getBranchOffice().getBranchOfficeId())
                    .withExpiresAt(getInstant())
                    .sign(algorithm);
        } catch (JWTCreationException exception) {
            throw new RuntimeException();
            // Invalid Signing configuration / Couldn't convert Claims.
        }
    }

    private Instant getInstant() {
        return LocalDateTime.now().plusHours(HOURS).toInstant(ZoneOffset.of("-06:00"));
    }


}
