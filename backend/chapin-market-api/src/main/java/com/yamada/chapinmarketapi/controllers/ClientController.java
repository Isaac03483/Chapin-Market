package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.ClientDTO;
import com.yamada.chapinmarketapi.dto.ClientResponse;
import com.yamada.chapinmarketapi.dto.UpdateClientRequest;
import com.yamada.chapinmarketapi.models.Client;
import com.yamada.chapinmarketapi.services.ClientService;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/chapin-market/clients")
@AllArgsConstructor
public class ClientController {

    private final ClientService clientService;

    @GetMapping("/{nit}")
    public ResponseEntity<ClientResponse> getClientByNit(@PathVariable String nit){
        Client client = this.clientService.getClientByNit(nit);
        return ResponseEntity.ok(new ClientResponse(client));
    }

    @GetMapping
    public ResponseEntity<Page<ClientDTO>> getAllClientsWithoutCard(@PageableDefault(size = 15) Pageable pageable) {
        Page<ClientDTO> page = this.clientService.getAllClientsWithoutCard(pageable);
        return ResponseEntity.ok(page);
    }

    @PostMapping
    public ResponseEntity<ClientDTO> addClient(@RequestBody ClientDTO clientDTO) {
        ClientDTO clientResponse = clientService.addClient(clientDTO);
        return ResponseEntity.ok(clientResponse);
    }

    @PutMapping
    @Transactional
    public ResponseEntity<ClientDTO> updateClient(@RequestBody UpdateClientRequest updateClientRequest) {
        Client client = this.clientService.updateClient(updateClientRequest);
        return ResponseEntity.ok(new ClientDTO(client));
    }

}
