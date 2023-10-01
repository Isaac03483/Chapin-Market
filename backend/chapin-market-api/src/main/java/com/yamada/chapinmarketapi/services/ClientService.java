package com.yamada.chapinmarketapi.services;

import com.yamada.chapinmarketapi.dto.ClientDTO;
import com.yamada.chapinmarketapi.dto.UpdateClientRequest;
import com.yamada.chapinmarketapi.exceptions.UserNotFoundException;
import com.yamada.chapinmarketapi.models.Client;
import com.yamada.chapinmarketapi.models.Employee;
import com.yamada.chapinmarketapi.repositories.ClientRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ClientService {

    private final ClientRepository clientRepository;
    private final AuthenticationManager authenticationManager;

    public ClientDTO addClient(ClientDTO clientDTO) {
        Client client = new Client(clientDTO);
        Client clientSaved = clientRepository.save(client);
        return  new ClientDTO(clientSaved);
    }

    public Page<ClientDTO> getAllClientsWithoutCard(Pageable pageable) {
        return this.clientRepository.getAllByClientCardNull(pageable).map(ClientDTO::new);
    }

    public Client getClientByNit(String nit) {
        Client client = this.clientRepository.getReferenceById(nit);

        if (client == null) {
            throw new UserNotFoundException("Client not found");
        }

        return client;
    }

    public Client updateClient(UpdateClientRequest updateClientRequest) {

        Authentication authToken = new UsernamePasswordAuthenticationToken(updateClientRequest.adminAuth().username(),
                updateClientRequest.adminAuth().password());

        Authentication authentication = authenticationManager.authenticate(authToken);
        Employee employee = (Employee) authentication.getPrincipal();

        if(employee == null) {
            throw new UserNotFoundException("No se encontró el usuario");
        }

        Client client = this.clientRepository.getReferenceById(updateClientRequest.clientInfo().nit());
        client.update(updateClientRequest.clientInfo());

        return client;
    }
}
