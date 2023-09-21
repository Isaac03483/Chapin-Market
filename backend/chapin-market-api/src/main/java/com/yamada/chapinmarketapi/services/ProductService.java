package com.yamada.chapinmarketapi.services;

import com.yamada.chapinmarketapi.dto.AddProductRequest;
import com.yamada.chapinmarketapi.dto.MoveProductRequest;
import com.yamada.chapinmarketapi.dto.ProductResponse;
import com.yamada.chapinmarketapi.exceptions.BranchOfficeDontMatchException;
import com.yamada.chapinmarketapi.exceptions.ProductNotFoundException;
import com.yamada.chapinmarketapi.models.BranchOffice;
import com.yamada.chapinmarketapi.models.Product;
import com.yamada.chapinmarketapi.models.ProductState;
import com.yamada.chapinmarketapi.repositories.BranchOfficeRepository;
import com.yamada.chapinmarketapi.repositories.ProductRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    private final BranchOfficeRepository branchOfficeRepository;

    public ProductResponse addProduct(AddProductRequest addProductRequest) {

        Product product = new Product(addProductRequest);

        Product productStored = productRepository.save(product);

        return new ProductResponse(productStored);
    }

    public ProductResponse moveProductToEstanteria(MoveProductRequest moveProductRequest) {
        Product product = productRepository.getReferenceById(moveProductRequest.productId());

        if (product == null) {
            throw new ProductNotFoundException("Product not found");
        }

        if(!product.getBranchOffice().getBranchOfficeId().equals(moveProductRequest.branchOfficeId())) {
            throw new BranchOfficeDontMatchException("Branch office don't match");
        }

        product.setProductState(ProductState.ESTANTERIA);
        return new ProductResponse(product);

    }

    public Page<ProductResponse> getProductsByBranchOfficeIdAndProductState(Pageable pageable, Long id, String state) {
        BranchOffice branchOffice = branchOfficeRepository.getReferenceById(id);

        if (branchOffice == null) {
            throw new BranchOfficeDontMatchException("Branch office id doesn't match");
        }

        ProductState productState = switch (state) {
            case "BODEGA" -> ProductState.BODEGA;
            case "ESTANTERIA" -> ProductState.ESTANTERIA;
            default -> ProductState.VENDIDO;
        };

        return productRepository.findAllByBranchOfficeAndProductState(pageable, branchOffice, productState)
                .map(ProductResponse::new);
    }
}
