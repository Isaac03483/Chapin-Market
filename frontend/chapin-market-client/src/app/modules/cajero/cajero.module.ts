import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CajeroRoutingModule } from './cajero-routing.module';
import { CajeroHomePageComponent } from './pages/cajero-home-page/cajero-home-page.component';
import {SharedModule} from "../../shared/shared.module";
import { AddSalePageComponent } from './pages/add-sale-page/add-sale-page.component';
import { AddClientPageComponent } from './pages/add-client-page/add-client-page.component';
import { UpdateClientPageComponent } from './pages/update-client-page/update-client-page.component';
import { ListProductPageComponent } from './pages/list-product-page/list-product-page.component';
import { SaleFormPageComponent } from './pages/sale-form-page/sale-form-page.component';
import {NgxPaginationModule} from "ngx-pagination";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";


@NgModule({
  declarations: [
    CajeroHomePageComponent,
    AddSalePageComponent,
    AddClientPageComponent,
    UpdateClientPageComponent,
    ListProductPageComponent,
    SaleFormPageComponent
  ],
    imports: [
        CommonModule,
        CajeroRoutingModule,
        SharedModule,
        NgxPaginationModule,
        FormsModule,
        ReactiveFormsModule
    ]
})
export class CajeroModule { }
