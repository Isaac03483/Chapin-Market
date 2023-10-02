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
        boolean clientExist = this.clientRepository.existsById(nit);

        if (!clientExist) {
            throw new UserNotFoundException("Cliente no encontrado");
        }

        return this.clientRepository.getReferenceById(nit);
    }

    public Client updateClient(UpdateClientRequest updateClientRequest) {

        Authentication authToken = new UsernamePasswordAuthenticationToken(updateClientRequest.adminAuth().username(),
                updateClientRequest.adminAuth().password());

        Authentication authentication = authenticationManager.authenticate(authToken);
        Employee employee = (Employee) authentication.getPrincipal();

        if(employee == null) {
            throw new UserNotFoundException("No se encontró el usuario");
        }

        boolean clientExist = this.clientRepository.existsById(updateClientRequest.clientInfo().nit());

        if (!clientExist) {
            throw new UserNotFoundException("Cliente no encontrado");
        }

        Client client = this.clientRepository.getReferenceById(updateClientRequest.clientInfo().nit());
        client.update(updateClientRequest.clientInfo());

        return client;
    }
}
