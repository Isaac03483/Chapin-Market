import {Component, OnInit} from '@angular/core';
import {LoginPageComponent} from "../../../modules/auth/pages/login-page/login-page.component";
import {Employee} from "../../../core/models/Employee";
import {AuthService} from "../../../modules/auth/services/auth.service";
import {EmployeeType} from "../../../core/models/EmployeeType";

@Component({
  selector: 'app-user-header',
  templateUrl: './user-header.component.html',
  styleUrls: ['./user-header.component.css']
})
export class UserHeaderComponent implements OnInit{

  protected readonly LoginPageComponent = LoginPageComponent;

  ngOnInit(): void {

  }
}
