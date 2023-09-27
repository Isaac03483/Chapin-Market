import {EventEmitter, Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../environments/environment";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  private readonly Url = 'http://localhost:8080/chapin-market';

  eventEmitter: EventEmitter<any> = new EventEmitter();

  constructor(private httpClient: HttpClient) { }


  getEmployeeById(id: number):Observable<any> {
    console.log(URL)
    return this.httpClient.get(`${this.Url}/employees/${id}`)
  }

  getEmployeesByBranchOfficeId(id: number,page: number) : Observable<any> {
    return this.httpClient.get(`${this.Url}/employees/branch-office/${id}?page=${page}`)
  }

  getEmployeeTypes() : Observable<any> {
    return this.httpClient.get(`${this.Url}/employees/types`);
  }

  addEmployee(employeeName:string, userName:string, employeePassword:string, branchOfficeId: number, employeeTypeId:number) : Observable<any> {
    const body = {
      employeeName,
      userName,
      employeePassword,
      branchOffice: {
        branchOfficeId
      },
      employeeType: {
        employeeTypeId
      }
    }
    return this.httpClient.post(`${this.Url}/employees`, body);
  }
}
