import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {catchError, Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class ClientCardService {

  private readonly Url = 'http://localhost:8080/chapin-market';


  constructor(private httpClient: HttpClient) { }

  getAllClientCards(page: number) : Observable<any> {
    return this.httpClient.get(`${this.Url}/client-cards?page=${page}`)
  }

  addClientCard(clientNit: string) : Observable<any> {
    const body = {
      clientNit
    }

    return this.httpClient.post(`${this.Url}/client-cards`, body)
  }

  improveClientCard(clientNit: string) : Observable<any> {
    const body = {
      clientNit
    }

    return this.httpClient.put(`${this.Url}/client-cards`, body)
  }
}
