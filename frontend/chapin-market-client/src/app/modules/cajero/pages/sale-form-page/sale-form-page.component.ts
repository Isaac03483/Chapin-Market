import {Component, Input, OnInit} from '@angular/core';
import {Employee} from "../../../../core/models/Employee";
import {ProductService} from "../../../../services/product/product.service";
import {ProductModel} from "../../../../core/models/ProductModel";
import Swal from "sweetalert2";
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {ClientService} from "../../../../services/client/client.service";
import {ClientWithCard} from "../../../../core/models/ClientModel";
import {BillService} from "../../../../services/bill/bill.service";

@Component({
  selector: 'app-sale-form-page',
  templateUrl: './sale-form-page.component.html',
  styleUrls: ['./sale-form-page.component.css']
})
export class SaleFormPageComponent implements OnInit{

  @Input() employeeData!: Employee;
  productsList: ProductModel[] = [];
  clientData: ClientWithCard | null = null;
  subTotal : number = 0;
  discount : number = 0;
  total: number = 0;
  usePointsChecked: boolean = false;
  clientDataState: ClientDataState = ClientDataState.WAITING;
  nit = new FormControl('', [Validators.minLength(9), Validators.pattern("[0-9]+")]);
  clientName = new FormControl('');
  updateName = new FormControl('');
  usePointsControl = new FormControl(false);
  billForm: FormGroup = new FormGroup({});

  constructor(private productService:ProductService, private clientService: ClientService, private billService: BillService) {
  }

  ngOnInit(): void {

    this.billForm = new FormGroup(
      {
        nit: this.nit,
        usePointsControl: this.usePointsControl
      }
    )

    this.updateBillInfo();

    this.nit.valueChanges.subscribe({
      next: (value) => {
        if(value?.trim().toLowerCase() === "cf" || value?.length === 0) {
          this.clientDataState = ClientDataState.WAITING;
        }
      }
    })

    this.productService.productToSaleList
      .subscribe((product: ProductModel) => {
        let find = this.productsList.find((p) => p.productId === product.productId);
        if(find) {
          Swal.fire({
            title: "Error",
            icon: "error",
            text: "Este producto ya ha sido agregado",
            showConfirmButton: false,
            timer: 2000
          })
          return;
        }

        this.productsList.push(product);
        this.subTotal += product.price;
        this.updateBillInfo();
    });


  }

  updateBillInfo() {

    this.total = this.subTotal - this.discount;
  }

  removeProduct(product: ProductModel) {
    this.productsList = this.productsList.filter((p) => p !== product);
    this.subTotal -= product.price;
    this.updateBillInfo();
  }

  searchClient() {
    let nitValue = this.nit.value;
    if(nitValue) {
      this.clientService.getClientByNit(nitValue)
        .subscribe({
          next: (response) => {
            console.log(response)
            this.clientData = response;

            if(this.clientData) {
              this.updateName.setValue(this.clientData.clientName);
            }
            this.clientDataState = ClientDataState.FOUND;

          },
          error: (error) => {
            console.log(error)
            Swal.fire({
              title: "No encontrado",
              icon: "error",
              text: "Cliente no encontrado",
              showConfirmButton: false,
              timer: 1000
            })

            this.clientData = null;
            this.clientDataState = ClientDataState.NOT_FOUND;

          }
        })
    }
  }

  protected readonly ClientDataState = ClientDataState;

  usePoints($event: any) {
    // console.log($event);

    if(!$event.target.checked) {
      this.usePointsChecked = !$event.target.checked;

      this.discount = 0
      this.updateBillInfo();
      return;
    }

    if(!this.clientData) {
      this.usePointsChecked = !$event.target.checked;

      Swal.fire({
        title: "Sin cliente",
        icon: "warning",
        text: "Solo los clientes registrados (con tarjeta) pueden usar puntos",
        showConfirmButton: false,
        timer: 1500
      })
      return;
    }

    if(!this.clientData.clientCard) {
      this.usePointsChecked = !$event.target.checked;

      Swal.fire({
        title: "Sin tarjeta",
        icon: "warning",
        text: "El cliente no posee una tarjeta",
        showConfirmButton: false,
        timer: 1500
      })


      return;
    }


    if(this.clientData.clientCard.currentPoints === 0) {
      this.usePointsChecked = !$event.target.checked;

      Swal.fire({
        title: "Sin puntos",
        icon: "warning",
        text: "El cliente no cuenta con puntos",
        showConfirmButton: false,
        timer: 1500
      })
      return;
    }

    if(this.clientData.clientCard.currentPoints > this.subTotal) {
      this.discount = this.subTotal;
      this.updateBillInfo();
      this.usePointsChecked = $event.target.checked;

      return;
    }

    this.discount = this.clientData?.clientCard.currentPoints;
    this.usePointsChecked = $event.target.checked;
    this.updateBillInfo();
  }

  saveClient() {
    let clientName = this.clientName.value;
    let nit = this.nit.value;

    this.clientService.addClient(nit!, clientName!)
      .subscribe({
        next: (response) => {
          Swal.fire({
            title: "Guardado!",
            icon: "success",
            text: "Cliente guardado con éxito",
            showConfirmButton: false,
            timer: 2000
          });
        },
        error: (error) => {
          Swal.fire({
            title: "Error!",
            icon: "error",
            text: "No se pudo guardar el cliente",
            showConfirmButton: false,
            timer: 2000
          });
        }
      })
  }

  updateClient() {
    let clientName = this.updateName.value?.trim();
    let nit = this.nit.value;

    if(!nit) {
      Swal.fire({
        title: "En blanco",
        icon: "warning",
        text: "No se ha especificado un nit",
        showConfirmButton: false,
        timer: 2000
      })
      return;
    }

    if(!clientName) {
      Swal.fire({
        title: "En blanco",
        icon: "warning",
        text: "No se ha especificado un nombre",
        showConfirmButton: false,
        timer: 2000
      })
      return;
    }

    if(clientName === this.clientData?.clientName) {
      Swal.fire({
        title: "No modificado",
        icon: "warning",
        text: "No se ha modificado el nombre",
        showConfirmButton: false,
        timer: 2000
      })
      return;
    }

    let username : string = '';
    let password: string = '';

    this.userRequest().then((result) => {
      if(result.isConfirmed) {
        username = result.value;
        this.passwordRequest().then((res) => {
          if(res.isConfirmed) {
            password = res.value;

            this.clientService.updateClient(nit!, clientName!, username, password)
              .subscribe({
                next: (response) => {
                  Swal.fire({
                    title: "Actualizado",
                    icon: "success",
                    text: "Cliente actualizado con éxito",
                    showConfirmButton: false,
                    timer: 2000
                  })
                  this.clientData = response;
                },
                error: (error) => {
                  console.log(error);
                  Swal.fire({
                    title: "Error!",
                    icon: "error",
                    text: "El administrador no se ha encontrado",
                    showConfirmButton: false,
                    timer: 2000
                  })
                }
              })
          }
        })
      }
    });


  }

  userRequest() {
    return Swal.fire({
      title: "Administrador",
      icon: "info",
      text: "Ingrese el usuario del administrador",
      input: "text",
      showCancelButton: true,
      showConfirmButton: true
    })
  }

  passwordRequest() {
    return Swal.fire({
      title: "Administrador",
      icon: "info",
      text: "Ingrese la contraseña del administrador",
      input: "password",
      showCancelButton: true,
      showConfirmButton: true
    })
  }

  saveBill() {

    if(this.productsList.length === 0) {
      Swal.fire({
        title: "Oops!",
        icon: "warning",
        text: "No se ha seleccionado ningún producto",
        showConfirmButton: false,
        timer: 2000
      })
      return;
    }

    const { nit, usePointsControl }  = this.billForm.value;

    const productIdsList = this.productsList.map(p =>  p.productId);

    console.log(nit, usePointsControl, productIdsList);

    this.billService.addNewBill(nit.toUpperCase(), this.employeeData.id, this.employeeData.branchOffice.id, productIdsList, usePointsControl)
      .subscribe({
        next: (response) => {
          Swal.fire({
            title: "Guardado!",
            icon: "success",
            text: "Venta realizada",
            showConfirmButton: false,
            timer: 2000
          })
        },
        error: (error) => {
          console.error(error)

          let message = '';

          if(error.error instanceof Array) {
            error.error.forEach((err: any) => {
              message += `${err.defaultMessage}\n`
            })
          } else {
            message = error.error;
          }

          Swal.fire({
            title: "Error!",
            icon: "error",
            text: message,
            showConfirmButton: false,
            timer: 2000
          })
        }
      })

  }
}

enum ClientDataState {
  WAITING, NOT_FOUND, FOUND
}
