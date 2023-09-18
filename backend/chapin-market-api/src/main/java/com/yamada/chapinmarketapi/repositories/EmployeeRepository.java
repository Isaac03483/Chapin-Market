package com.yamada.chapinmarketapi.repositories;

import com.yamada.chapinmarketapi.models.BranchOffice;
import com.yamada.chapinmarketapi.models.Employee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    UserDetails findByUserName(String userName);

    Page<Employee> findAllByBranchOffice(Pageable pageable, BranchOffice branchOffice);
}
