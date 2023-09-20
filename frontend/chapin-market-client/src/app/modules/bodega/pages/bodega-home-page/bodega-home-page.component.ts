import {Component, OnInit} from '@angular/core';
import {Employee} from "../../../../core/models/Employee";
import {ActivatedRoute} from "@angular/router";
import {EmployeeService} from "../../../../shared/services/employee.service";

@Component({
  selector: 'app-bodega-home-page',
  templateUrl: './bodega-home-page.component.html',
  styleUrls: ['./bodega-home-page.component.css']
})
export class BodegaHomePageComponent implements OnInit {
  // employee: Employee;

  employee: Employee | null = null;

  constructor(private router: ActivatedRoute, private employeeService: EmployeeService) {
  }

  ngOnInit(): void {
    let id = 0;
    this.router.queryParams.subscribe(params => {
      id = params['id'];
    })

    this.employeeService.getEmployeeById(id).subscribe((response) => {
      this.employee = response;
      // console.log(this.employee)
    });
  }
}
