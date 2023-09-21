import {ProductState} from "./ProductState";
import {BranchOffice} from "./BranchOffice";

export class ProductModel {
  productId: number;
  productName: string;
  productState: ProductState;
  branchOffice: BranchOffice;
  brand: string;
  price: number;


  constructor(productId: number, productName: string, productState: ProductState, branchOffice: BranchOffice, brand: string, price: number) {
    this.productId = productId;
    this.productName = productName;
    this.productState = productState;
    this.branchOffice = branchOffice;
    this.brand = brand;
    this.price = price;
  }
}
