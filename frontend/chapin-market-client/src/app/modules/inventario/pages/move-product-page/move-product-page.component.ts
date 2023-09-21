import {Component, Input, OnInit} from '@angular/core';
import {Employee} from "../../../../core/models/Employee";
import {ProductModel} from "../../../../core/models/ProductModel";
import {ProductService} from "../../../../services/product/product.service";
import {ProductState} from "../../../../core/models/ProductState";
import Swal from "sweetalert2";

@Component({
  selector: 'app-move-product-page',
  templateUrl: './move-product-page.component.html',
  styleUrls: ['./move-product-page.component.css']
})
export class MoveProductPageComponent implements OnInit{

  @Input() employeeData!: Employee;
  products: ProductModel[] = [];
  currentIndex: number = 0;
  numberOfElements: number = 0;

  constructor(private productService: ProductService) {
  }

  ngOnInit(): void {
    this.currentIndex = 0;
    this.getPage();
  }

  getPage() {
    this.productService.getAllProductsByBranchOfficeAndProductState(this.employeeData.branchOffice.id,
      ProductState.BODEGA, this.currentIndex)
      .subscribe((response) => {
        console.log(response.content)
        this.products = response.content;
        this.numberOfElements = response.totalElements;
      })
  }


  getPageAt($event: number) {
    this.currentIndex = $event;
    this.getPage();
  }

  moveTo(product: ProductModel) {
    this.productService.moveProductToEstanteria(product.productId, this.employeeData.branchOffice.id)
      .subscribe((response) => {
        Swal.fire({
          title: 'Hecho!',
          text: 'producto movido a Estantería',
          timer: 1000,
          icon: 'success',
          showConfirmButton: false
        })

        if(response.productState === 'ESTANTERIA') {

          product.productState = ProductState.ESTANTERIA;

        }
      })
  }

  protected readonly ProductState = ProductState;
}
