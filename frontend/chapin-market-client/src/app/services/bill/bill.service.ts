import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class BillService {

  private readonly Url = 'http://localhost:8080/chapin-market';


  constructor(private httpClient: HttpClient) { }

  addNewBill(clientNit: string, employeeId: number, branchOfficeId: number, products: number[], usePoints: boolean) : Observable<any> {
    const body = {
      clientNit,
      employeeId,
      branchOfficeId,
      products,
      usePoints
    }
    return this.httpClient.post(`${this.Url}/bills`, body);
  }

  topTenBills(before: string, after: string) : Observable<any> {
    return this.httpClient.get(`${this.Url}/bills/reports/top-ten-bills/${before}/${after}`);
  }

  topThreeBranchOffice(before: string, after: string) : Observable<any> {
    return this.httpClient.get(`${this.Url}/bills/reports/top-three-branch-offices/${before}/${after}`);
  }

  topTenClients(before: string, after: string) : Observable<any> {
    return this.httpClient.get(`${this.Url}/bills/reports/top-ten-clients/${before}/${after}`);
  }

}
