import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CajeroRoutingModule } from './cajero-routing.module';
import { CajeroHomePageComponent } from './pages/cajero-home-page/cajero-home-page.component';
import {SharedModule} from "../../shared/shared.module";
import { AddSalePageComponent } from './pages/add-sale-page/add-sale-page.component';
import { AddClientPageComponent } from './pages/add-client-page/add-client-page.component';
import { UpdateClientPageComponent } from './pages/update-client-page/update-client-page.component';


@NgModule({
  declarations: [
    CajeroHomePageComponent,
    AddSalePageComponent,
    AddClientPageComponent,
    UpdateClientPageComponent
  ],
    imports: [
        CommonModule,
        CajeroRoutingModule,
        SharedModule
    ]
})
export class CajeroModule { }
