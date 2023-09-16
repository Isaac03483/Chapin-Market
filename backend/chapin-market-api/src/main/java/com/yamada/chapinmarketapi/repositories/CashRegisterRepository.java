package com.yamada.chapinmarketapi.repositories;

import com.yamada.chapinmarketapi.models.CashRegister;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CashRegisterRepository extends JpaRepository<CashRegister, Long> {
}
