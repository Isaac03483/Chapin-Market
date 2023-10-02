import {BranchOffice} from "./BranchOffice";
import {ClientModel} from "./ClientModel";

export class BranchOfficeWithTotal {
  branchOffice: BranchOffice;
  total: number;


  constructor(branchOffice: BranchOffice, total: number) {
    this.branchOffice = branchOffice;
    this.total = total;
  }
}

export class ClientWithTotal {
  client: ClientModel;
  total: number;


  constructor(client: ClientModel, total: number) {
    this.client = client;
    this.total = total;
  }
}

export class BillModel {
  billId: number;
  nit: string;
  subTotal: number;
  discount: number;
  total: number;


  constructor(billId: number, nit: string, subTotal: number, discount: number, total: number) {
    this.billId = billId;
    this.nit = nit;
    this.subTotal = subTotal;
    this.discount = discount;
    this.total = total;
  }
}
