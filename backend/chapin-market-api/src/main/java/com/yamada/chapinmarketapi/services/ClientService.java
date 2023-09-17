package com.yamada.chapinmarketapi.services;

import com.yamada.chapinmarketapi.dto.ClientDTO;
import com.yamada.chapinmarketapi.models.Client;
import com.yamada.chapinmarketapi.repositories.ClientRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ClientService {

    private final ClientRepository clientRepository;

    public ClientDTO addClient(ClientDTO clientDTO) {
        Client client = new Client(clientDTO);
        Client clientSaved = clientRepository.save(client);
        return  new ClientDTO(clientSaved);
    }
}
