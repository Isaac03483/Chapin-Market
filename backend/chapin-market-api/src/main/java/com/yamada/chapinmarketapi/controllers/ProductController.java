package com.yamada.chapinmarketapi.controllers;

import com.yamada.chapinmarketapi.dto.AddProductRequest;
import com.yamada.chapinmarketapi.dto.MoveProductRequest;
import com.yamada.chapinmarketapi.dto.ProductResponse;
import com.yamada.chapinmarketapi.models.Product;
import com.yamada.chapinmarketapi.services.ProductService;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import jakarta.websocket.server.PathParam;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

@RestController
@RequestMapping("/chapin-market/products")
@AllArgsConstructor
public class ProductController {

    private final ProductService productService;

    @PostMapping
    public ResponseEntity<ProductResponse> addNewProduct(@RequestBody @Valid AddProductRequest addProductRequest) {
        ProductResponse productResponse = productService.addProduct(addProductRequest);
        return ResponseEntity.ok(productResponse);
    }

    @PutMapping
    @Transactional
    public ResponseEntity<ProductResponse> moveProductToEstanteria(@RequestBody MoveProductRequest moveProductRequest) {
        ProductResponse productResponse = productService.moveProductToEstanteria(moveProductRequest);
        return ResponseEntity.ok(productResponse);
    }

}
