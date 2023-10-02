package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.CardTypeDTO;
import com.yamada.chapinmarketapi.services.CardTypeService;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/chapin-market/cards")
@AllArgsConstructor
public class CardTypeController {

    private CardTypeService cardService;

    @GetMapping()
    public ResponseEntity<Page<CardTypeDTO>> getAllCardTypes(@PageableDefault(size = 15, sort = "cardTypeId") Pageable pageable) {
        Page<CardTypeDTO> allCardTypes = cardService.getAllCardTypes(pageable);
        return ResponseEntity.ok(allCardTypes);
    }

    @PutMapping()
    @Transactional
    public ResponseEntity<CardTypeDTO> updateCardType(@RequestBody @Valid CardTypeDTO cardTypeDTO) {
        System.out.println(cardTypeDTO);
        CardTypeDTO cardTypeResponse = cardService.updateCardType(cardTypeDTO);
        return ResponseEntity.ok(cardTypeResponse);
    }
}
