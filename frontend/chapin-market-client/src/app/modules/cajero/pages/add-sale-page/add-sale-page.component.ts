import {Component, Input} from '@angular/core';
import {Employee} from "../../../../core/models/Employee";

@Component({
  selector: 'app-add-sale-page',
  templateUrl: './add-sale-page.component.html',
  styleUrls: ['./add-sale-page.component.css']
})
export class AddSalePageComponent {

  @Input() employeeData!: Employee;

}
