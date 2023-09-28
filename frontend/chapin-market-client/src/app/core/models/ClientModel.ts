import {CardModel} from "./CardModel";
import {ClientCardModel} from "./ClientCardModel";

export class ClientModel {
  nit: string;
  clientName: string;

  constructor(nit: string, clientName: string) {
    this.nit = nit;
    this.clientName = clientName;
  }
}

export class ClientWithCard {
  nit: string;
  clientName: string;
  clientCard: ClientCardModel;


  constructor(nit: string, clientName: string, clientCard: ClientCardModel) {
    this.nit = nit;
    this.clientName = clientName;
    this.clientCard = clientCard;
  }
}
