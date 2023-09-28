import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class ClientService {

  private readonly Url = 'http://localhost:8080/chapin-market';

  constructor(private httpClient: HttpClient) { }

  getAllClientsWithoutCard(currentIndex: number) : Observable<any> {
    return this.httpClient.get(`${this.Url}/clients?page=${currentIndex}`);
  }

  getClientByNit(nit: string) : Observable<any> {
    return this.httpClient.get(`${this.Url}/clients/${nit}`);
  }

  addClient(nit: string, clientName: string) : Observable<any> {
    const body = {
      nit,
      clientName
    }
    return this.httpClient.post(`${this.Url}/clients`, body);
  }

  updateClient(nit: string, clientName: string, username: string, password: string) : Observable<any> {
    const body = {
      clientInfo: {
        nit,
        clientName
      },
      adminAuth: {
        username,
        password
      }
    }
    return this.httpClient.put(`${this.Url}/clients`, body);
  }
}
