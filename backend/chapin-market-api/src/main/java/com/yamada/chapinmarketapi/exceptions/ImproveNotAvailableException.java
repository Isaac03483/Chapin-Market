package com.yamada.chapinmarketapi.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
public class ImproveNotAvailableException extends RuntimeException {
    public ImproveNotAvailableException(String s) {
        super(s);
    }
}
