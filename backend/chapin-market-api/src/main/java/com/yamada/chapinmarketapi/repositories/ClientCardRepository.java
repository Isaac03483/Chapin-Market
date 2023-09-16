package com.yamada.chapinmarketapi.repositories;

import com.yamada.chapinmarketapi.models.ClientCard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientCardRepository extends JpaRepository<ClientCard,  String> {
}
