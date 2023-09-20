import {Component, OnInit} from '@angular/core';
import {Employee} from "../../../../core/models/Employee";
import {EmployeeService} from "../../../../shared/services/employee.service";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-inv-home-page',
  templateUrl: './inv-home-page.component.html',
  styleUrls: ['./inv-home-page.component.css']
})
export class InvHomePageComponent implements OnInit {

  employee: Employee | null = null;

  constructor(private employeeService: EmployeeService, private activatedRoute: ActivatedRoute) {
  }

  ngOnInit(): void {
    let id = 0;

    this.activatedRoute.queryParams.subscribe(params => {
      id = params['id'];
    })

    this.employeeService.getEmployeeById(id).subscribe((response) => {
      this.employee = response;
    })
  }

}
