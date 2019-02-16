import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { BanHangComponent } from './dashboard/ban-hang/ban-hang.component';
import { HangHoaComponent } from './dashboard/hang-hoa/hang-hoa.component';
import { CKEditorModule } from 'ng2-ckeditor';
import { ThongKeComponent } from './dashboard/thong-ke/thong-ke.component';
import { HoaDonComponent } from './dashboard/hoa-don/hoa-don.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    DashboardComponent,
    BanHangComponent,
    HangHoaComponent,
    ThongKeComponent,
    HoaDonComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    CKEditorModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
