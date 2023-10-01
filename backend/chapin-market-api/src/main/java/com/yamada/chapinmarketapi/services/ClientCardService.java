package com.yamada.chapinmarketapi.services;

import com.yamada.chapinmarketapi.dto.ClientCardRequest;
import com.yamada.chapinmarketapi.dto.ClientCardResponse;
import com.yamada.chapinmarketapi.models.CardType;
import com.yamada.chapinmarketapi.models.ClientCard;
import com.yamada.chapinmarketapi.repositories.CardTypeRepository;
import com.yamada.chapinmarketapi.repositories.ClientCardRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
@AllArgsConstructor
public class ClientCardService {

    private final ClientCardRepository clientCardRepository;
    private final CardTypeRepository cardTypeRepository;

    public Page<ClientCardResponse> getAllClientCards(Pageable pageable) {
        return clientCardRepository.findAll(pageable).map(ClientCardResponse::new);
    }

    public ClientCardResponse addClientCard(ClientCardRequest clientCard) {
        CardType cardType = cardTypeRepository.getReferenceById(1L);
        ClientCard newClientCard = new ClientCard(clientCard.clientNit(), cardType,new BigDecimal(0), 0);
        clientCardRepository.save(newClientCard);
        return new ClientCardResponse(newClientCard);
    }

    public ClientCardResponse improveClientCard(ClientCardRequest clientCard) {
        ClientCard card = this.clientCardRepository.getReferenceById(clientCard.clientNit());
        CardType cardType = this.cardTypeRepository.getReferenceById(card.getCardType().getCardTypeId());

        if(cardType == null) {
            throw new RuntimeException("NO SE ENCONTRÓ UNA TARJETA A MEJORAR");
        }

        if(card.getCurrentSpent().compareTo(cardType.getMinSpent()) < 0) {
            throw new RuntimeException("NO POSEE LOS REQUISITOS PARA MEJORAR DE TARJETA");
        }

        card.update(cardType);
        return new ClientCardResponse(card);
    }
}
