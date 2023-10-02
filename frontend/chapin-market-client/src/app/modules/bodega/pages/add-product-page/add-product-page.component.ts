import {Component, Input, OnInit} from '@angular/core';
import {Employee} from "../../../../core/models/Employee";
import {ProductService} from "../../../../services/product/product.service";
import {FormControl, FormGroup} from "@angular/forms";
import Swal from 'sweetalert2';

@Component({
  selector: 'app-add-product-page',
  templateUrl: './add-product-page.component.html',
  styleUrls: ['./add-product-page.component.css']
})
export class AddProductPageComponent implements OnInit{

  @Input() employeeData: Employee | null = null;

  addProductForm: FormGroup = new FormGroup({})

  constructor(private productService: ProductService) {
  }

  ngOnInit(): void {
    this.addProductForm = new FormGroup(
      {
        productName: new FormControl(''),
        brand: new FormControl(''),
        price: new FormControl('')

      }
    )
  }

  addProduct() {

    const { productName, brand, price } = this.addProductForm.value;

    this.productService.addNewProduct(productName, this.employeeData!.branchOffice.id, brand, price)
      .subscribe({

        next: (response) => {
          console.log(response)
          this.addProductForm.reset();
          Swal.fire({
            title: 'Producto Guardado!',
            text: 'El producto se guardó con éxito!',
            icon: 'success',
            timer: 1000,
            showConfirmButton: false
          })
        },
        error: (error) => {
          Swal.fire({
            title: "Error!",
            icon: "error",
            text: "No se pudo guardar el producto, verifique los campos",
            showConfirmButton: false,
            timer: 2000
          })
        }
      })
  }

}
