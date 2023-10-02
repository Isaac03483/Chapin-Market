package com.yamada.chapinmarketapi.services;

import com.yamada.chapinmarketapi.dto.ClientCardRequest;
import com.yamada.chapinmarketapi.dto.ClientCardResponse;
import com.yamada.chapinmarketapi.exceptions.CardTypeNotFoundException;
import com.yamada.chapinmarketapi.exceptions.ClientCardNotFoundException;
import com.yamada.chapinmarketapi.exceptions.ImproveNotAvailableException;
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
        boolean cardTypeExist = cardTypeRepository.existsById(card.getCardType().getCardTypeId() + 1);

        if(!cardTypeExist) {
            throw new CardTypeNotFoundException("No se encontró la tarjeta a mejorar");
        }

        CardType cardType = this.cardTypeRepository.getReferenceById(card.getCardType().getCardTypeId() + 1);



        if(card.getCurrentSpent().compareTo(cardType.getMinSpent()) < 0) {
            throw new ImproveNotAvailableException("No posee los requisitos para mejorar la tarjeta");
        }

        card.update(cardType);
        return new ClientCardResponse(card);
    }
}
