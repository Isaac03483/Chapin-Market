import {Component, OnInit} from '@angular/core';
import {CardModel} from "../../../../../core/models/CardModel";
import {CardService} from "../../../../../services/card/card.service";
import {FormControl, FormGroup} from "@angular/forms";
import Swal from "sweetalert2";

@Component({
  selector: 'app-update-card-page',
  templateUrl: './update-card-page.component.html',
  styleUrls: ['./update-card-page.component.css']
})
export class UpdateCardPageComponent implements OnInit{

  cardToUpdate: CardModel | null = null;
  updateForm: FormGroup = new FormGroup({})

  constructor(private cardService: CardService) {
  }

  ngOnInit(): void {
    this.cardService.eventEmitter
      .subscribe((card) => {
        console.log(card);
        this.cardToUpdate = card;
      })

    this.updateForm = new FormGroup(
      {
        pointsPerReq: new FormControl(this.cardToUpdate?.pointsPerReq),
        minSpent: new FormControl(this.cardToUpdate?.minSpent)
      }
    )
  }

  sendData() {
    if(this.cardToUpdate) {
      const { pointsPerReq, minSpent } = this.updateForm.value;
      this.cardService.updateCard(this.cardToUpdate.id, this.cardToUpdate.cardName, this.cardToUpdate.requirements, pointsPerReq, minSpent)
        .subscribe({
          next: (response) => {
            Swal.fire({
              title: "Cambios guardados!",
              icon: "success",
              text: "Tarjeta actualizada exitosamente",
              showConfirmButton: false,
              timer: 2000
            })
          },
          error: (error) => {
            Swal.fire({
              title: "Error!",
              icon: "error",
              text: "No se pudo actualizar la tarjeta, verifique los campos",
              showConfirmButton: false,
              timer: 2000
            })
          }
        })
    }
  }
}
