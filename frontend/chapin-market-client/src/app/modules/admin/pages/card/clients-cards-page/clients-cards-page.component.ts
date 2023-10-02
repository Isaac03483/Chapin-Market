import {Component, OnInit} from '@angular/core';
import {ClientCardService} from "../../../../../services/client-card/client-card.service";
import {ClientCardModel} from "../../../../../core/models/ClientCardModel";
import Swal from "sweetalert2";
import {HttpStatusCode} from "@angular/common/http";

@Component({
  selector: 'app-clients-cards-page',
  templateUrl: './clients-cards-page.component.html',
  styleUrls: ['./clients-cards-page.component.css']
})
export class ClientsCardsPageComponent implements OnInit {

  currentIndex: number = 1;
  numberOfElements: number = 0;
  clientCards: ClientCardModel[] = [];

  constructor(private clientCardService: ClientCardService) {
  }

  ngOnInit(): void {
    this.currentIndex = 1;
    this.getPage();
  }

  getPage() {
    this.clientCardService.getAllClientCards(this.currentIndex - 1)
      .subscribe({
        next: (response) => {
          this.clientCards = response.content;
          this.numberOfElements = response.totalElements;
        },
        error: (error) => {
          Swal.fire({
            title: "Error",
            icon: "error",
            text: "No se pudo obtener las tarjetas de clientes",
            showConfirmButton: false,
            timer: 2000
          })
        }
      })
  }

  getPageAt($event: number) {
    this.currentIndex = $event;
    this.getPage();
  }


  sendData(clientCard: ClientCardModel) {
    this.clientCardService.improveClientCard(clientCard.clientNit)
      .subscribe({
        next: (response) => {
          Swal.fire({
            title: "Actualizado",
            icon: "success",
            text: "Tarjeta actualizada",
            showConfirmButton: false,
            timer: 2000
          })
        },
        error: (error) => {
          console.log(error);
          if(error.status === HttpStatusCode.UnprocessableEntity) {
            Swal.fire({
              title: "Error",
              icon: "error",
              text: "No se cuenta con los puntos necesarios",
              showConfirmButton: false,
              timer: 2000
            })
          } else if(error.status === HttpStatusCode.NotFound) {
            Swal.fire({
              title: "Error",
              icon: "error",
              text: "No se encontró otra mejora para la tarjeta",
              showConfirmButton: false,
              timer: 2000
            })
          }
        }
      })
  }
}
