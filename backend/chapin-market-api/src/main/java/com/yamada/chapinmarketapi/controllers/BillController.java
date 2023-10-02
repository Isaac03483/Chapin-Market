package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.BillRequest;
import com.yamada.chapinmarketapi.dto.BillResponse;
import com.yamada.chapinmarketapi.dto.BranchWithTotalResponse;
import com.yamada.chapinmarketapi.dto.ClientWithTotalResponse;
import com.yamada.chapinmarketapi.models.Bill;
import com.yamada.chapinmarketapi.models.BranchOfficeWithTotal;
import com.yamada.chapinmarketapi.models.ClientWithTotal;
import com.yamada.chapinmarketapi.services.BillService;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/chapin-market/bills")
@AllArgsConstructor
public class BillController {

    private final BillService billService;

    @PostMapping
    @Transactional
    public ResponseEntity<BillResponse> addBill(@RequestBody @Valid BillRequest billRequest) {
        Bill bill = this.billService.addNewBill(billRequest);
        return ResponseEntity.ok(new BillResponse(bill));
    }

    @GetMapping({"/reports/top-ten-bills/{before}/{after}", "/reports/top-ten-bills"})
    public ResponseEntity<List<BillResponse>> topTenBills(@PathVariable(required = false) LocalDate before,
                                                          @PathVariable(required = false) LocalDate after) {
        if(before == null || after == null) {
            List<Bill> bills = this.billService.topTenBills();
            return ResponseEntity.ok(bills.stream().map(BillResponse::new).toList());
        }

        List<Bill> bills = this.billService.topTenBills(before, after);
        return ResponseEntity.ok(bills.stream().map(BillResponse::new).toList());
    }

    @GetMapping({"/reports/top-three-branch-offices/{before}/{after}", "/reports/top-three-branch-offices"})
    public ResponseEntity<List<BranchWithTotalResponse>> topThreeBranch(@PathVariable(required = false) LocalDate before,
                                                                        @PathVariable(required = false) LocalDate after) {

        if(before == null || after == null) {
            List<BranchOfficeWithTotal> branchOfficeWithTotals = this.billService.topThreeBranchOffices();
            return ResponseEntity.ok(branchOfficeWithTotals.stream().map(BranchWithTotalResponse::new).toList());
        }

        List<BranchOfficeWithTotal> branchOfficeWithTotals = this.billService.topThreeBranchOffices(before, after);
        return ResponseEntity.ok(branchOfficeWithTotals.stream().map(BranchWithTotalResponse::new).toList());
    }

    @GetMapping({"/reports/top-ten-clients/{before}/{after}", "/reports/top-ten-clients"})
    public ResponseEntity<List<ClientWithTotalResponse>> topTenClients(@PathVariable(required = false) LocalDate before,
                                                                       @PathVariable(required = false) LocalDate after) {

        if(before == null || after == null) {
            List<ClientWithTotal> clientWithTotals = this.billService.topTenClients();
            return ResponseEntity.ok(clientWithTotals.stream().map(ClientWithTotalResponse::new).toList());
        }

        List<ClientWithTotal> clientWithTotals = this.billService.topTenClients(before, after);
        return ResponseEntity.ok(clientWithTotals.stream().map(ClientWithTotalResponse::new).toList());
    }

    @GetMapping({"/reports/historical/{before}/{after}", "/reports/historical"})
    public ResponseEntity<List<BillResponse>> historicalDiscount(@PathVariable(required = false) LocalDate before,
                                                                       @PathVariable(required = false) LocalDate after) {

        if(before == null || after == null) {
            List<Bill> historicalBills = this.billService.historical();
            return ResponseEntity.ok(historicalBills.stream().map(BillResponse::new).toList());
        }

        List<Bill> historicalBills = this.billService.historical(before, after);
        return ResponseEntity.ok(historicalBills.stream().map(BillResponse::new).toList());
    }
}
