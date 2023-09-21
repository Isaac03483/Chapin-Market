import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing.module';
import { AdminHomePageComponent } from './pages/admin-home-page/admin-home-page.component';
import {SharedModule} from "../../shared/shared.module";
import { AddEmployeePageComponent } from './pages/add-employee-page/add-employee-page.component';
import { AddCardPageComponent } from './pages/add-card-page/add-card-page.component';
import { UpdateCardPageComponent } from './pages/update-card-page/update-card-page.component';
import { AddClientCardPageComponent } from './pages/add-client-card-page/add-client-card-page.component';


@NgModule({
  declarations: [
    AdminHomePageComponent,
    AddEmployeePageComponent,
    AddCardPageComponent,
    UpdateCardPageComponent,
    AddClientCardPageComponent
  ],
    imports: [
        CommonModule,
        AdminRoutingModule,
        SharedModule
    ]
})
export class AdminModule { }