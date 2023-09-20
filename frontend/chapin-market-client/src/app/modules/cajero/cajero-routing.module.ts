import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {CajeroHomePageComponent} from "./pages/cajero-home-page/cajero-home-page.component";

const routes: Routes = [
  {
    path: '',
    component: CajeroHomePageComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CajeroRoutingModule { }
