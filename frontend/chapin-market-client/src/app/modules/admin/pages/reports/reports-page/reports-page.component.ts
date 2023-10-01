import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {BillService} from "../../../../../services/bill/bill.service";

@Component({
  selector: 'app-reports-page',
  templateUrl: './reports-page.component.html',
  styleUrls: ['./reports-page.component.css']
})
export class ReportsPageComponent implements OnInit{

  options : any = [
    {id: 0, value: "Seleccione un reporte"},
    {id: 1, value: "Historial de descuentos"},
    {id: 2, value: "Top 10 ventas más grandes"},
    {id: 3, value: "Top 3 sucursales"},
    {id: 4, value: "Top 10 clientes"}
  ];

  reportForm : FormGroup = new FormGroup({})
  rows: any[] = [];

  constructor(private billService: BillService) {
  }

  ngOnInit(): void {
    this.reportForm = new FormGroup(
      {
        reportType: new FormControl(0, [Validators.required, Validators.min(1)]),
        before: new FormControl('', Validators.required),
        after: new FormControl('', Validators.required)
      }
    )
  }


  sendData() {
    const { reportType, before, after } = this.reportForm.value;
    console.log(reportType, before, after);
    switch (reportType) {
      case "1":

        break;
      case "2":
        console.log("get top ten bills")
        this.billService.topTenBills(before, after)
          .subscribe({
            next: (response) => {
              console.log(response);
            }
          })
        break;
      case "3":
        this.billService.topThreeBranchOffice(before, after)
          .subscribe({
            next: (response) => {
              console.log(response);
            }
          })
        break;
      case "4":
        this.billService.topTenClients(before, after)
          .subscribe({
            next: (response) => {
              console.log(response);
            }
          })
        break;
    }
  }

}
