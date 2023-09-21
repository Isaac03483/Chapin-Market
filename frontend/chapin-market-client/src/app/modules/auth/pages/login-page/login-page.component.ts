import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup} from "@angular/forms";
import {AuthService} from "../../../../services/auth/auth.service";
import {Employee} from "../../../../core/models/Employee";
import {EmployeeType} from "../../../../core/models/EmployeeType";
import {BranchOffice} from "../../../../core/models/BranchOffice";
import {CookieService} from "ngx-cookie-service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrls: ['./login-page.component.css']
})
export class LoginPageComponent implements OnInit{

  formLogin: FormGroup = new FormGroup({});

  constructor(private authService: AuthService, private cookieService: CookieService, private router: Router) {
  }

  ngOnInit(): void {

    this.formLogin = new FormGroup (
        {
            username: new FormControl(''),
            password: new FormControl('')
        }
    );
  }

  sendLogin() {
    const { username, password } = this.formLogin.value;

    this.authService.auth(username, password).subscribe((response) => {
      // console.log(response);

      const { employeeResponse, jwt } = response;
      const params = {
        id: employeeResponse.id
      }

      this.cookieService.set('token', jwt, 4, '/')

      // console.log("empleado",employeeResponse)
      switch (employeeResponse.employeeType.employeeTypeName) {
        case 'CAJERO':
          this.router.navigate(['/','cajero'], { queryParams: params })
          break;
        case 'BODEGA':
          this.router.navigate(['/','bodega'], { queryParams: params })

          break;
        case 'INVENTARIO':
          this.router.navigate(['/','inventario'], { queryParams: params })

          break;
        case 'ADMINISTRADOR':
          this.router.navigate(['/','admin'], { queryParams: params });

          break;
        default:

      }
    });
  }
}
