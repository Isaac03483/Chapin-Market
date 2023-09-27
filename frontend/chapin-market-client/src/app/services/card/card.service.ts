import {EventEmitter, Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class CardService {

  private readonly Url = 'http://localhost:8080/chapin-market';
  eventEmitter: EventEmitter<any> = new EventEmitter();

  constructor(private httpClient: HttpClient) { }

  getAllCardsTypes(currentIndex: number) : Observable<any> {
    return this.httpClient.get(`${this.Url}/cards?page=${currentIndex}`);
  }

  updateCard(id: number, cardName: string, requirements: number, pointsPerReq: number, minSpent: number) : Observable<any> {
    const body = {
      id,
      cardName,
      pointsPerReq,
      requirements,
      minSpent
    }

    console.log(body)
    return this.httpClient.put(`${this.Url}/cards`, body);
  }
}
