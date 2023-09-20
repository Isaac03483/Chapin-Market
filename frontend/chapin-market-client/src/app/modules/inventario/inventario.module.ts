import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { InventarioRoutingModule } from './inventario-routing.module';
import { InvHomePageComponent } from './pages/inv-home-page/inv-home-page.component';
import {SharedModule} from "../../shared/shared.module";
import { MoveProductPageComponent } from './pages/move-product-page/move-product-page.component';
import { ShowProductsPageComponent } from './pages/show-products-page/show-products-page.component';


@NgModule({
  declarations: [
    InvHomePageComponent,
    MoveProductPageComponent,
    ShowProductsPageComponent
  ],
    imports: [
        CommonModule,
        InventarioRoutingModule,
        SharedModule
    ]
})
export class InventarioModule { }
