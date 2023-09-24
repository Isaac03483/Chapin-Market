import {Component, OnInit} from '@angular/core';
import {Employee} from "../../../../core/models/Employee";
import {EmployeeService} from "../../../../services/employee/employee.service";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-admin-home-page',
  templateUrl: './admin-home-page.component.html',
  styleUrls: ['./admin-home-page.component.css']
})
export class AdminHomePageComponent implements OnInit {

  employee: Employee | null = null;
  navBarState: NavBarState = NavBarState.CLOSED;

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

  setNavBarState(navBarState: NavBarState) {
    this.navBarState = navBarState;
  }

  protected readonly NavBarState = NavBarState;
}

enum NavBarState {
  EMPLOYEES, CARDS, CLOSED
}
