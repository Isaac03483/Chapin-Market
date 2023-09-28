import {Component, Input, OnInit} from '@angular/core';
import {ProductState} from "../../../../core/models/ProductState";
import {ProductService} from "../../../../services/product/product.service";
import {ProductModel} from "../../../../core/models/ProductModel";
import {Employee} from "../../../../core/models/Employee";

@Component({
  selector: 'app-list-product-page',
  templateUrl: './list-product-page.component.html',
  styleUrls: ['./list-product-page.component.css']
})
export class ListProductPageComponent implements OnInit{

  @Input() employeeData!: Employee;
  currentIndex: number = 1;
  numberOfElements: number = 1;
  products: ProductModel[] = [];

  constructor(private productService: ProductService) {
  }

  ngOnInit() {
    this.currentIndex = 1;
    this.getPage();
  }

  getPage() {
    this.productService.getAllProductsByBranchOfficeAndProductState(this.employeeData.branchOffice.id, ProductState.ESTANTERIA,
      this.currentIndex - 1)
      .subscribe({
        next: (response) => {
          this.products = response.content;
          this.numberOfElements = response.totalElements;
        },
        error: (error) => {

        }
      })
  }

  getPageAt($event: number) {
    this.currentIndex = $event;
    this.getPage();
  }

  addToList(product: ProductModel) {
    this.productService.productToSaleList.emit(product);
  }
}
