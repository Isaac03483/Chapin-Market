package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.ClientCardRequest;
import com.yamada.chapinmarketapi.dto.ClientCardResponse;
import com.yamada.chapinmarketapi.services.ClientCardService;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/chapin-market/client-cards")
@AllArgsConstructor
public class ClientCardController {

    private final ClientCardService clientCardService;

    @GetMapping
    public ResponseEntity<Page<ClientCardResponse>> getAllClientCards(@PageableDefault(size = 15) Pageable pageable) {
        Page<ClientCardResponse> allClientCards = this.clientCardService.getAllClientCards(pageable);
        return ResponseEntity.ok(allClientCards);
    }

    @PostMapping
    public ResponseEntity<ClientCardResponse> addClientCard(@RequestBody ClientCardRequest clientCard) {
        ClientCardResponse clientCardResponse = this.clientCardService.addClientCard(clientCard);
        return ResponseEntity.ok(clientCardResponse);
    }

    @PutMapping
    @Transactional
    public ResponseEntity<ClientCardResponse> improveClientCard(@RequestBody ClientCardRequest clientCard) {
        ClientCardResponse clientCardResponse = this.clientCardService.improveClientCard(clientCard);
        return ResponseEntity.ok(clientCardResponse);
    }
}
