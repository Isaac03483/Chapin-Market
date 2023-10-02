package com.yamada.chapinmarketapi.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
public class CardTypeNotFoundException extends RuntimeException {
    public CardTypeNotFoundException(String s) {
        super(s);
    }
}
