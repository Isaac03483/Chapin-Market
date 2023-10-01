package com.yamada.chapinmarketapi.repositories;

import com.yamada.chapinmarketapi.models.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface BillRepository extends JpaRepository<Bill, Long> {

    @Query("""
    SELECT b FROM Bill b WHERE b.billDate BETWEEN :before AND :after ORDER BY b.total DESC LIMIT 10
    """)
    List<Bill> topTenBills(@Param("before") LocalDate before,@Param("after") LocalDate after);

    @Query("""
    SELECT branch, SUM(bill.total) AS total FROM BranchOffice branch INNER JOIN Bill bill
    ON branch.branchOfficeId = bill.branchOffice.branchOfficeId
    WHERE bill.billDate BETWEEN :before AND :after
    GROUP BY branch.branchOfficeId
    ORDER BY total DESC
    """)
    List<BranchOfficeWithTotal> topThreeBranchOffices(@Param("before") LocalDate before, @Param("after") LocalDate after);

    @Query("""
    SELECT client, SUM(bill.total) as total FROM Client client INNER JOIN Bill bill
    ON client.nit = bill.client.nit
    WHERE bill.billDate BETWEEN :before AND :after
    GROUP BY client.nit
    ORDER BY total DESC
    """)
    List<ClientWithTotal> topTenClients(@Param("before") LocalDate before, @Param("after") LocalDate after);
}
