import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BodegaRoutingModule } from './bodega-routing.module';
import { BodegaHomePageComponent } from './pages/bodega-home-page/bodega-home-page.component';
import {SharedModule} from "../../shared/shared.module";
import { AddProductPageComponent } from './pages/add-product-page/add-product-page.component';
import {ReactiveFormsModule} from "@angular/forms";


@NgModule({
  declarations: [
    BodegaHomePageComponent,
    AddProductPageComponent,
  ],
    imports: [
        CommonModule,
        BodegaRoutingModule,
        SharedModule,
        ReactiveFormsModule
    ]
})
export class BodegaModule { }
