import {Component, Input, OnInit} from '@angular/core';
import {Employee} from "../../../../../core/models/Employee";
import {EmployeeService} from "../../../../../services/employee/employee.service";
import {FormControl, FormGroup} from "@angular/forms";
import {EmployeeType} from "../../../../../core/models/EmployeeType";
import Swal from "sweetalert2";

@Component({
  selector: 'app-add-employee-page',
  templateUrl: './add-employee-page.component.html',
  styleUrls: ['./add-employee-page.component.css']
})
export class AddEmployeePageComponent implements OnInit{

  @Input() employeeData!: Employee;
  employeeTypes: EmployeeType[] = [];
  employeeForm: FormGroup = new FormGroup({});

  constructor(private employeeService: EmployeeService) {
  }

  ngOnInit(): void {

    this.employeeService.getEmployeeTypes()
      .subscribe((response) => {
        this.employeeTypes = response
      })

    this.employeeForm = new FormGroup(
      {
        employeeName: new FormControl(''),
        username: new FormControl(''),
        password: new FormControl(''),
        passwordCheck: new FormControl(''),
        employeeType: new FormControl(0)
      }
    )
  }

  protected readonly EmployeeType = EmployeeType;

  sendData() {
    const {employeeName, username: userName, password: employeePassword, passwordCheck, employeeType} = this.employeeForm.value

    if (employeeType === 0) {
      Swal.fire({
        icon: "question",
        text: "Por favor eliga un tipo de empleado",
        timer: 1500,
        showConfirmButton: false
      })
      return;
    }

    if (employeePassword !== passwordCheck) {
      Swal.fire({
        title: "Error",
        icon: "error",
        text: "Las contraseñas no coinciden",
        timer: 1500,
        showConfirmButton: false
      })
      return;
    }

    this.employeeService.addEmployee(employeeName, userName, employeePassword, this.employeeData.branchOffice.id, employeeType)
      .subscribe({
        next: (response) => {
          console.log(response)
          this.employeeService.eventEmitter.emit(response);
          Swal.fire({
            title: "Ok",
            text: "Usuario guardado con éxito",
            icon: "success",
            showConfirmButton: false,
            timer: 1500
          })
          this.employeeForm.reset();
        },
        error: (error) => {
          console.log(error.error);
          Swal.fire({
            title: "Error!",
            icon: "error",
            text: "No se pudo guardar, verifique los campos",
            showConfirmButton: false,
            timer: 2000
          })
        }
      })
  }
}
