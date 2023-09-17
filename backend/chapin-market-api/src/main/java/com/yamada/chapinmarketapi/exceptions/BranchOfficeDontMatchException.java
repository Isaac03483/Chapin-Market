package com.yamada.chapinmarketapi.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class BranchOfficeDontMatchException extends RuntimeException{

    public BranchOfficeDontMatchException(String message) {
        super(message);
    }
}
