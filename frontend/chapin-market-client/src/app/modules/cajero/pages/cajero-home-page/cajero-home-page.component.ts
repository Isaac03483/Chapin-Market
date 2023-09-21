import {Component, OnInit} from '@angular/core';
import {Employee} from "../../../../core/models/Employee";
import {EmployeeService} from "../../../../services/employee/employee.service";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-cajero-home-page',
  templateUrl: './cajero-home-page.component.html',
  styleUrls: ['./cajero-home-page.component.css']
})
export class CajeroHomePageComponent implements OnInit {

  employee: Employee | null = null;
  protected readonly NavBarState = NavBarState;

  navBarState: NavBarState = NavBarState.CLOSED;

  constructor(private employeeService: EmployeeService, private activatedRoute: ActivatedRoute) {
  }

  ngOnInit(): void {
    let id = 0;

    this.activatedRoute.queryParams.subscribe(params => {
      id = params['id'];
    })

    this.employeeService.getEmployeeById(id).subscribe(response => {
      this.employee = response;
    })

  }

  changeNavBarState(newState: NavBarState) {
    this.navBarState = newState;
  }

}

enum NavBarState {
  ADD_CLIENT, UPDATE_CLIENT, ADD_SALE, CLOSED
}
