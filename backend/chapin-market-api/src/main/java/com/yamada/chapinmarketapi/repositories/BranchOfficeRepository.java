package com.yamada.chapinmarketapi.repositories;

import com.yamada.chapinmarketapi.models.BranchOffice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BranchOfficeRepository extends JpaRepository<BranchOffice, Long> {
}
