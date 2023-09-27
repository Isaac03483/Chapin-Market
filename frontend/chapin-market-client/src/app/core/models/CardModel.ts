export class CardModel {
  id: number;
  cardName: string;
  requirements: number;
  pointsPerReq: number;
  minSpent: number;


  constructor(id: number, cardName: string, requirements: number, pointsPerReq: number, minSpent: number) {
    this.id = id;
    this.cardName = cardName;
    this.requirements = requirements;
    this.pointsPerReq = pointsPerReq;
    this.minSpent = minSpent;
  }
}
