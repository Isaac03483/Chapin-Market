package com.yamada.chapinmarketapi.repositories;

import com.yamada.chapinmarketapi.models.CardType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CardTypeRepository extends JpaRepository<CardType, Long> {
}
