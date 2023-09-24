import {Component, Input, OnInit} from '@angular/core';
import {Employee} from "../../../../core/models/Employee";

@Component({
  selector: 'app-employees-page',
  templateUrl: './employees-page.component.html',
  styleUrls: ['./employees-page.component.css']
})
export class EmployeesPageComponent implements OnInit{

  @Input() employeeData!: Employee;

  constructor() {
  }

  ngOnInit(): void {
  }

}
