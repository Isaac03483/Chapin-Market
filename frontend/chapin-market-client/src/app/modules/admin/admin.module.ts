import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing.module';
import { AdminHomePageComponent } from './pages/admin-home-page/admin-home-page.component';
import {SharedModule} from "../../shared/shared.module";
import { AddEmployeePageComponent } from './pages/employees/add-employee-page/add-employee-page.component';
import { ListEmployeesPageComponent } from './pages/employees/list-employees-page/list-employees-page.component';
import {NgxPaginationModule} from "ngx-pagination";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {EmployeesPageComponent} from "./pages/employees/employees-page/employees-page.component";
import { ClientsWCardsPageComponent } from './pages/card/clients-w-cards-page/clients-w-cards-page.component';
import { ClientsCardsPageComponent } from './pages/card/clients-cards-page/clients-cards-page.component';
import { ListCardsTypesPageComponent } from './pages/card/list-cards-types-page/list-cards-types-page.component';
import { CardsMenuComponent } from './pages/card/cards-menu/cards-menu.component';
import { CardsHomePageComponent } from './pages/card/cards-home-page/cards-home-page.component';
import { ClientsCardsHomePageComponent } from './pages/card/clients-cards-home-page/clients-cards-home-page.component';
import { UpdateCardPageComponent } from './pages/card/update-card-page/update-card-page.component';
import { ReportsPageComponent } from './pages/reports/reports-page/reports-page.component';


@NgModule({
  declarations: [
    AdminHomePageComponent,
    AddEmployeePageComponent,
    ListEmployeesPageComponent,
    EmployeesPageComponent,
    ClientsWCardsPageComponent,
    ClientsCardsPageComponent,
    ListCardsTypesPageComponent,
    CardsMenuComponent,
    CardsHomePageComponent,
    ClientsCardsHomePageComponent,
    UpdateCardPageComponent,
    ReportsPageComponent,
  ],
    imports: [
        CommonModule,
        AdminRoutingModule,
        SharedModule,
        NgxPaginationModule,
        ReactiveFormsModule,
        FormsModule
    ]
})
export class AdminModule { }
