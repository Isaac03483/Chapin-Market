import {CardModel} from "./CardModel";

export class ClientCardModel {

  clientNit: string;
  cardType!: CardModel;
  currentSpent: number;
  currentPoints: number


  constructor(clientNit: string, cardType: CardModel, currentSpent: number, currentPoints: number) {
    this.clientNit = clientNit;
    this.cardType = cardType;
    this.currentSpent = currentSpent;
    this.currentPoints = currentPoints;
  }
}
