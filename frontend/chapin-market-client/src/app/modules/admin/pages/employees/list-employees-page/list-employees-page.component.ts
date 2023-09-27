import {Component, Input, OnInit} from '@angular/core';
import {EmployeeService} from "../../../../../services/employee/employee.service";
import {Employee} from "../../../../../core/models/Employee";

@Component({
  selector: 'app-list-employees-page',
  templateUrl: './list-employees-page.component.html',
  styleUrls: ['./list-employees-page.component.css']
})
export class ListEmployeesPageComponent implements OnInit{

  @Input() employeeData!: Employee;

  currentIndex: number = 1;
  numberOfElements: number = 0;
  employees: Employee[] = [];

  constructor(private employeeService: EmployeeService) {

  }

  ngOnInit(): void {
    this.currentIndex = 1;
    this.getEmployees();

    this.employeeService.eventEmitter.subscribe((response) => {
      this.getEmployees();
    })
  }

  getEmployees() {
    this.employeeService.getEmployeesByBranchOfficeId(this.employeeData.branchOffice.id, this.currentIndex - 1)
      .subscribe((response) => {
        this.employees = response.content;
        this.numberOfElements = response.totalElements;
      })
  }


  getPageAt($event: number) {
    this.currentIndex = $event;
    this.getEmployees();
  }
}
