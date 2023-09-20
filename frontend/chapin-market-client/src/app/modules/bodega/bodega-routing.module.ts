import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {BodegaHomePageComponent} from "./pages/bodega-home-page/bodega-home-page.component";
import {BodegaModule} from "./bodega.module";

const routes: Routes = [
  {
    path: '',
    component: BodegaHomePageComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BodegaRoutingModule { }
