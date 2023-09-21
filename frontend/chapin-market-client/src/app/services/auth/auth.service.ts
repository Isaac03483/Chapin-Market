import {EventEmitter, Injectable, Output} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private readonly Url = 'http://localhost:8080/chapin-market';

  constructor(private httpClient: HttpClient) { }

  auth(username: string, password: string) : Observable<any> {
    const body = {
      username, password
    }

    return this.httpClient.post(`${this.Url}/login`,body)
  }
}
