package com.yamada.chapinmarketapi.repositories;

import com.yamada.chapinmarketapi.models.Bill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BillRepository extends JpaRepository<Bill, Long> {
}
