import {Employee} from "./Employee";

export class AuthModel {
  employee: Employee;
  jwt: string;


  constructor(employee: Employee, jwt: string) {
    this.employee = employee;
    this.jwt = jwt;
  }
}
