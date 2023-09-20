import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {InvHomePageComponent} from "./pages/inv-home-page/inv-home-page.component";

const routes: Routes = [
  {
    path: '',
    component: InvHomePageComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class InventarioRoutingModule { }
