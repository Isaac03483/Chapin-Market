import {Component, Input, OnInit} from '@angular/core';
import {EmployeeService} from "../../../../services/employee/employee.service";
import {Employee} from "../../../../core/models/Employee";

@Component({
  selector: 'app-list-employees-page',
  templateUrl: './list-employees-page.component.html',
  styleUrls: ['./list-employees-page.component.css']
})
export class ListEmployeesPageComponent implements OnInit{

  @Input() employeeData!: Employee;

  currentIndex: number = 0;
  numberOfElements: number = 0;
  employees: Employee[] = [];

  constructor(private employeeService: EmployeeService) {

  }

  ngOnInit(): void {
    console.log(this.employeeData.branchOffice);
    this.currentIndex = 0;
    this.getEmployees();
  }

  getEmployees() {
    this.employeeService.getEmployeesByBranchOfficeId(this.employeeData.branchOffice.id, this.currentIndex)
      .subscribe((response) => {
        this.employees = response.content;
      })
  }


  getPageAt($event: number) {

  }
}
