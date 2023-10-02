package com.yamada.chapinmarketapi.services;

import com.yamada.chapinmarketapi.dto.BillRequest;
import com.yamada.chapinmarketapi.exceptions.ClientCardNotFoundException;
import com.yamada.chapinmarketapi.exceptions.NoPointsException;
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
        List<Product> products = billRequest.products().stream().map(productRepository::getReferenceById).toList();
        BigDecimal subTotal = products.stream().map(Product::getPrice).reduce(BigDecimal.ZERO,BigDecimal::add);
        BigDecimal discount = BigDecimal.ZERO;
        BigDecimal total = BigDecimal.valueOf(subTotal.doubleValue());

        if(!billRequest.clientNit().equalsIgnoreCase("CF")) {
            boolean cardExists = this.clientCardRepository.existsById(client.getNit());


            if(billRequest.usePoints() && !cardExists) {
                throw new ClientCardNotFoundException("El cliente no posee una tarjeta");
            }

            if(!cardExists) {
                return saveBill(employee, client, products, subTotal, discount, total);

            }

            ClientCard clientCard = this.clientCardRepository.getReferenceById(client.getNit());
            if(billRequest.usePoints()) {

                if(clientCard.getCurrentPoints() == 0) {
                    throw new NoPointsException("El cliente no cuenta con puntos");
                }

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

        }

        return saveBill(employee, client, products, subTotal, discount, total);
    }

    private Bill saveBill(Employee employee, Client client, List<Product> products, BigDecimal subTotal, BigDecimal discount, BigDecimal total) {
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

    public List<Bill> topTenBills() {
        return this.billRepository.topTenBills();
    }

    public List<Bill> topTenBills(LocalDate before, LocalDate after) {
        return this.billRepository.topTenBills(before, after);
    }

    public List<BranchOfficeWithTotal> topThreeBranchOffices(LocalDate before, LocalDate after) {
        return this.billRepository.topThreeBranchOffices(before, after);
    }

    public List<BranchOfficeWithTotal> topThreeBranchOffices() {
        return this.billRepository.topThreeBranchOffices();
    }

    public List<ClientWithTotal> topTenClients(LocalDate before, LocalDate after) {
        return this.billRepository.topTenClients(before, after);
    }

    public List<ClientWithTotal> topTenClients() {
        return this.billRepository.topTenClients();
    }


    public List<Bill> historical(LocalDate before, LocalDate after) {
        return this.billRepository.historicalDiscount(before, after);
    }

    public List<Bill> historical() {
        return this.billRepository.historicalDiscount();
    }
}
