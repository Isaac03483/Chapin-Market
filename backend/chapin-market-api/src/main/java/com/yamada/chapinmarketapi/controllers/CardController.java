package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.CardTypeRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/chapin-market/cards")
public class CardController {

    public ResponseEntity addCardType(CardTypeRequest cardTypeRequest) {
        return null;
    }
}
