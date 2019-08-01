import { EditarIngresoPage } from './componentes/ingresos/editar-ingreso/editar-ingreso.page';
import { UsuariosService } from './servicios/usuarios.service';
import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';

import { IonicModule, IonicRouteStrategy } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatButtonModule, MatCheckboxModule } from '@angular/material';
import {MatInputModule} from '@angular/material/input';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatSelectModule} from '@angular/material/select';
import {HttpClientModule} from '@angular/common/http';
import {DatePipe} from '@angular/common';


@NgModule({
  declarations: [AppComponent],
  entryComponents: [],
  exports: [MatFormFieldModule,MatSelectModule,MatInputModule],
  imports: [BrowserModule, IonicModule.forRoot(), AppRoutingModule,
    BrowserAnimationsModule, MatButtonModule, MatCheckboxModule,
     MatInputModule,  
     MatFormFieldModule,
     MatSelectModule,
     HttpClientModule,
     FormsModule,
     ],
  providers: [
    UsuariosService,
    StatusBar,
    SplashScreen,
    DatePipe,
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
