import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing.module';
import { AdminHomePageComponent } from './pages/admin-home-page/admin-home-page.component';
import {SharedModule} from "../../shared/shared.module";


@NgModule({
  declarations: [
    AdminHomePageComponent
  ],
    imports: [
        CommonModule,
        AdminRoutingModule,
        SharedModule
    ]
})
export class AdminModule { }
