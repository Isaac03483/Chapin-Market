package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.ClientDTO;
import com.yamada.chapinmarketapi.dto.UpdateClientRequest;
import com.yamada.chapinmarketapi.models.Client;
import com.yamada.chapinmarketapi.services.ClientService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/chapin-market/clients")
@AllArgsConstructor
public class ClientController {

    private final ClientService clientService;

    @PostMapping
    public ResponseEntity<ClientDTO> addClient(@RequestBody ClientDTO clientDTO) {
        ClientDTO clientResponse = clientService.addClient(clientDTO);
        return ResponseEntity.ok(clientResponse);
    }

    @PutMapping
    public ResponseEntity<ClientDTO> updateClient(@RequestBody UpdateClientRequest updateClientRequest) {
        return null;
    }

}
