import {Component, Input, OnInit} from '@angular/core';
import {ProductService} from "../../../../services/product/product.service";
import {ProductModel} from "../../../../core/models/ProductModel";
import {Employee} from "../../../../core/models/Employee";
import {ProductState} from "../../../../core/models/ProductState";
import {PaginationService} from "ngx-pagination";

@Component({
  selector: 'app-show-products-page',
  templateUrl: './show-products-page.component.html',
  styleUrls: ['./show-products-page.component.css']
})
export class ShowProductsPageComponent implements OnInit{

  @Input() employeeData!: Employee;

  products: ProductModel[] = [];
  currentIndex: number = 0;
  numberOfElements: number = 0;

  constructor(private productService: ProductService) {
  }

  ngOnInit(): void {
    this.currentIndex = 0;
    this.getPage()
  }

  getPage() {
    this.productService.getAllProductsByBranchOfficeAndProductState(this.employeeData.branchOffice.id,
      ProductState.ESTANTERIA, this.currentIndex)
      .subscribe((response) => {
        this.products = response.content;
        this.numberOfElements = response.totalElements;
      })
  }

  getPageAt($event: number) {
    this.currentIndex = $event;
    this.getPage();
  }
}
