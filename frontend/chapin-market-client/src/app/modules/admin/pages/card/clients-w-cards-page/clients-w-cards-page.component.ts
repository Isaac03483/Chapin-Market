import {Component, OnInit} from '@angular/core';
import {ClientService} from "../../../../../services/client/client.service";
import {ClientModel} from "../../../../../core/models/ClientModel";
import {ClientCardService} from "../../../../../services/client-card/client-card.service";
import Swal from "sweetalert2";

@Component({
  selector: 'app-clients-w-cards-page',
  templateUrl: './clients-w-cards-page.component.html',
  styleUrls: ['./clients-w-cards-page.component.css']
})
export class ClientsWCardsPageComponent implements OnInit {

  currentIndex: number = 1;
  numberOfElements: number = 0;
  clients: ClientModel[] = [];

  constructor(private clientService: ClientService, private clientCardService: ClientCardService) {
  }

  ngOnInit(): void {
    this.currentIndex = 1;
    this.getPage();

  }

  getPage() {
    this.clientService.getAllClientsWithoutCard(this.currentIndex - 1)
      .subscribe((response) => {
        console.log(response);
        this.clients = response.content;
        this.numberOfElements = response.totalElements;
      })
  }

  getPageAt($event: number) {
    this.currentIndex = $event;
    this.getPage();
  }

  sendData(client: ClientModel) {
    this.clientCardService.addClientCard(client.nit)
      .subscribe({
        next: response => {
          console.log(response);
          Swal.fire({
            title: "Tarjeta agregada!",
            icon: "success",
            text: "Tarjeta agregada con éxito",
            showConfirmButton: false,
            timer: 1500,
          })
        },
        error: err => {
          console.log(err);
        }
        })
  }
}
