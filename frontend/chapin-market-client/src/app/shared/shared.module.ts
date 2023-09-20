import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UserHeaderComponent } from './components/user-header/user-header.component';
import {RouterLink} from "@angular/router";
import { UserInfoComponent } from './components/user-info/user-info.component';

@NgModule({
  declarations: [
    UserHeaderComponent,
    UserInfoComponent
  ],
  imports: [
    CommonModule,
    RouterLink
  ],
    exports: [
        UserHeaderComponent,
        UserInfoComponent
    ]
})
export class SharedModule { }
