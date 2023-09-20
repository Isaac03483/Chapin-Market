import {EmployeeType} from "./EmployeeType";
import {BranchOffice} from "./BranchOffice";

export class Employee {
  id: number;
  employeeName: string;
  userName: string;
  employeeType: EmployeeType;
  branchOffice: BranchOffice;


  constructor(id: number, employeeName: string, userName: string, employeeType: EmployeeType, branchOffice: BranchOffice) {
    this.id = id;
    this.employeeName = employeeName;
    this.userName = userName;
    this.employeeType = employeeType;
    this.branchOffice = branchOffice;
  }


}
