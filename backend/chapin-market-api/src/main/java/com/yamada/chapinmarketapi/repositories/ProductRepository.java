package com.yamada.chapinmarketapi.repositories;

import com.yamada.chapinmarketapi.models.BranchOffice;
import com.yamada.chapinmarketapi.models.Product;
import com.yamada.chapinmarketapi.models.ProductState;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    Page<Product> findAllByBranchOfficeAndProductState(Pageable pageable, BranchOffice branchOffice, ProductState state);
}
