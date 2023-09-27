package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.services.CardTypeService;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/chapin-market/cards")
public class CardController {

    private CardTypeService cardService;

    @GetMapping()
    public ResponseEntity getAllCardTypes(@PageableDefault(size = 15) Pageable pageable) {
        return
    }
}
