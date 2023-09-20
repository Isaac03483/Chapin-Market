import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../environments/environment";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  private readonly Url = 'http://localhost:8080/chapin-market';

  constructor(private httpClient: HttpClient) { }


  getEmployeeById(id: number):Observable<any> {
    console.log(URL)
    return this.httpClient.get(`${this.Url}/employees/${id}`)
  }
}
