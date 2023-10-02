package com.yamada.chapinmarketapi.exceptions;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;

@RestControllerAdvice
public class ExcHandler {

    @ExceptionHandler({
            EntityNotFoundException.class,
            ClientCardNotFoundException.class,
            UserNotFoundException.class,
            ProductNotFoundException.class,
            BranchOfficeDontMatchException.class
    })
    public ResponseEntity<String> handleEntityNotFound(RuntimeException e) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<List<FieldError>> handleArgumentNotValid(MethodArgumentNotValidException e){
        return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY).body(e.getFieldErrors());
    }

    @ExceptionHandler(ImproveNotAvailableException.class)
    public ResponseEntity<String> handleImproveNotAvailable(ImproveNotAvailableException e) {
        return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY).body(e.getMessage());
    }

    @ExceptionHandler(NoPointsException.class)
    public ResponseEntity<String> handleImproveNotAvailable(NoPointsException e) {
        return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY).body(e.getMessage());
    }

    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<String> handlePSQLException() {
        return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY).body("No se pudo procesar la información");

    }
}
