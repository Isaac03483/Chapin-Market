import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class ClientService {

  private readonly Url = 'http://localhost:8080/chapin-market';

  constructor(private httpClient: HttpClient) { }

  getAllClientsWithoutCard(currentIndex: number)  : Observable<any> {
    return this.httpClient.get(`${this.Url}/clients?page=${currentIndex}`);
  }

}
