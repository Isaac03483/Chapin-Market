import {Component, Input, OnInit} from '@angular/core';
import {Employee} from "../../../core/models/Employee";
import {EmployeeService} from "../../services/employee.service";
import {ActivatedRoute, Router} from "@angular/router";
import {CookieService} from "ngx-cookie-service";

@Component({
  selector: 'app-user-info',
  templateUrl: './user-info.component.html',
  styleUrls: ['./user-info.component.css']
})
export class UserInfoComponent implements OnInit{

  @Input() employeeData!: Employee;
  employeeInfo : Employee | null = null;

  constructor(private router: Router, private cookie: CookieService) {
  }

  ngOnInit(): void {
    // console.log("recibiendo data",this.employeeData);
    this.employeeInfo = this.employeeData;
  }

  logout() {
    this.cookie.delete('token');
    this.router.navigate(['/', 'auth'])
  }
}
