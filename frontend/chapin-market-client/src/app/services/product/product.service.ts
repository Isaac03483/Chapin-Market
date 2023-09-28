import {EventEmitter, Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {BranchOffice} from "../../core/models/BranchOffice";

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private readonly Url = 'http://localhost:8080/chapin-market';
  productToSaleList: EventEmitter<any> = new EventEmitter();

  constructor(private httpClient: HttpClient) { }

  getAllProductsByBranchOfficeAndProductState(id: number, state: string, currentIndex: number) : Observable<any> {
    console.log(`${this.Url}/products/${id}/${state}?page=${currentIndex}`);
    return this.httpClient.get(`${this.Url}/products/${id}/${state}?page=${currentIndex}`)
  }

  addNewProduct(productName: string, branchOfficeId: number, brand: string, price: number) : Observable<any> {
    const body = {
      productName,
      branchOffice: {
        branchOfficeId
      },
      brand,
      price
    }

    return this.httpClient.post(`${this.Url}/products`, body);
  }

  moveProductToEstanteria(productId: number, branchOfficeId: number) : Observable<any>{
    const body = {
      productId,
      branchOfficeId
    }

    return this.httpClient.put(`${this.Url}/products`, body);
  }
}
