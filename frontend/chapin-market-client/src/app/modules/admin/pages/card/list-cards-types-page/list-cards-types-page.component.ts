import {Component, OnInit} from '@angular/core';
import {CardModel} from "../../../../../core/models/CardModel";
import {CardService} from "../../../../../services/card/card.service";

@Component({
  selector: 'app-list-cards-types-page',
  templateUrl: './list-cards-types-page.component.html',
  styleUrls: ['./list-cards-types-page.component.css']
})
export class ListCardsTypesPageComponent implements OnInit{

  currentIndex: number = 1;
  numberOfElements: number = 1;
  cards: CardModel[] = [];

  constructor(private cardService: CardService) {
  }

  ngOnInit(): void {
    this.currentIndex = 1;
    this.getPage();
  }

  getPageAt($event: number) {
    this.currentIndex = $event;
    this.getPage();
  }

  private getPage() {
    this.cardService.getAllCardsTypes(this.currentIndex - 1)
      .subscribe((response) => {
        console.log(response)
        this.cards = response.content;
        this.numberOfElements = response.totalElements;
      })
  }

  sendData(card: CardModel) {
    this.cardService.eventEmitter.emit(card);
  }
}
