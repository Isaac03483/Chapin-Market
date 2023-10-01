package com.yamada.chapinmarketapi.repositories;

import com.yamada.chapinmarketapi.models.Client;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepository extends JpaRepository<Client, String> {

    @Query("SELECT c FROM Client c LEFT JOIN ClientCard cc ON c.nit = cc.clientNit WHERE cc.clientNit IS NULL AND c.nit != 'CF'")
    Page<Client> getAllByClientCardNull(Pageable pageable);
}
