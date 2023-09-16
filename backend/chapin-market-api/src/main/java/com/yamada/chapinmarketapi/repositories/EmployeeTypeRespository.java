package com.yamada.chapinmarketapi.repositories;

import com.yamada.chapinmarketapi.models.EmployeeType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeTypeRespository extends JpaRepository<EmployeeType, Long> {
}
