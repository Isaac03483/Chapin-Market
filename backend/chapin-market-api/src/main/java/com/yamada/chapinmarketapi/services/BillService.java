package com.yamada.chapinmarketapi.services;

import com.yamada.chapinmarketapi.dto.BillRequest;
import com.yamada.chapinmarketapi.exceptions.ClientCardNotFoundException;
import com.yamada.chapinmarketapi.models.*;
import com.yamada.chapinmarketapi.repositories.*;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Service
@AllArgsConstructor
public class BillService {

    private final ClientRepository clientRepository;
    private final EmployeeRepository employeeRepository;
    private final ProductRepository productRepository;
    private final BillRepository billRepository;
    private final SaleDetailRepository saleDetailRepository;
    private final ClientCardRepository clientCardRepository;

    public Bill addNewBill(BillRequest billRequest) {
        Employee employee = this.employeeRepository.getReferenceById(billRequest.employeeId());
        Client client = this.clientRepository.getReferenceById(billRequest.clientNit());
        ClientCard clientCard = this.clientCardRepository.getReferenceById(client.getNit());
        List<Product> products = billRequest.products().stream().map(productRepository::getReferenceById).toList();
        BigDecimal subTotal = products.stream().map(Product::getPrice).reduce(BigDecimal.ZERO,BigDecimal::add);
        BigDecimal discount = BigDecimal.ZERO;
        BigDecimal total = BigDecimal.valueOf(subTotal.doubleValue());

        if(billRequest.usePoints() && client.getClientCard() == null) {
            throw new ClientCardNotFoundException("The client doesn't have a card");
        }

        System.out.println("billRequest.usePoints() = " + billRequest.usePoints());
        if(billRequest.usePoints()) {

            if(clientCard.getCurrentPoints() > subTotal.doubleValue()) {

                discount = BigDecimal.valueOf(subTotal.intValue());

            } else {

                discount = BigDecimal.valueOf(clientCard.getCurrentPoints());

            }
            total = BigDecimal.valueOf(subTotal.doubleValue() - discount.intValue());

        }

        clientCard.setCurrentPoints(clientCard.getCurrentPoints() - discount.intValue());
        clientCard.setCurrentSpent(clientCard.getCurrentSpent().add(total));
        int points = (int) (total.doubleValue() / clientCard.getCardType().getRequirements().doubleValue()) * clientCard.getCardType().getPointsPerReq();
        clientCard.setCurrentPoints(clientCard.getCurrentPoints() + points);

        Bill bill = new Bill();
        bill.setClient(client);
        bill.setSubTotal(subTotal);
        bill.setDiscount(discount);
        bill.setTotal(total);
        bill.setEmployee(employee);
        bill.setBranchOffice(employee.getBranchOffice());

        Bill billSaved = this.billRepository.save(bill);

        products.forEach(product -> {
                    SaleDetail saleDetail = new SaleDetail(null, billSaved, product, 1);
                    this.saleDetailRepository.save(saleDetail);
                    product.setProductState(ProductState.VENDIDO);
                });

        
        return billSaved;
    }

    public List<Bill> topTenBills(LocalDate before, LocalDate after) {
        return this.billRepository.topTenBills(before, after);
    }

    public List<BranchOfficeWithTotal> topThreeBranchOffices(LocalDate before, LocalDate after) {
        return this.billRepository.topThreeBranchOffices(before, after);
    }

    public List<ClientWithTotal> topTenClients(LocalDate before, LocalDate after) {
        return this.billRepository.topTenClients(before, after);
    }
}
