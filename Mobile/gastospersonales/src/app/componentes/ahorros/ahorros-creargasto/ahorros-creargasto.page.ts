import { AhorrosService } from './../../../servicios/ahorros.service';
import { cgastos } from './../../../modelos/CGastos';
import { Component, OnInit } from '@angular/core';
import { DatePipe } from '@angular/common';
import { ToastController } from '@ionic/angular';
import { ActivatedRoute, Router } from '@angular/router';


cgastos

@Component({
  selector: 'app-ahorros-creargasto',
  templateUrl: './ahorros-creargasto.page.html',
  styleUrls: ['./ahorros-creargasto.page.scss'],
})
export class AhorrosCreargastoPage implements OnInit {

  gasto:cgastos=new cgastos
  constructor(private router:Router,private ar:ActivatedRoute,private ahorroservice:AhorrosService,public toastController: ToastController,private datePipe:DatePipe) { }

  ngOnInit() {
    this.ar.params.subscribe(x=>{
      this.gasto.cuentas_id=x.id
    })
  }

  guardar(){
    console.log(this.gasto)
    console.log(this.gasto);
   
    this.gasto.fecha=this.datePipe.transform(this.gasto.fecha,"yyyy-MM-dd")
    this.ahorroservice.crearCgasto(this.gasto).subscribe(x=>
      {
        this.router.navigate(['tabs/ahorrosgastos',this.gasto.cuentas_id])
        this.presentToast()
        this.gasto.cantidad=null;
        this.gasto.cuentas_id=null;
        this.gasto.fecha="";
        this.gasto.nombre_gasto="";
        this.gasto.id=null
        this.ahorroservice.notificargastoupload.emit(this.gasto)
        
      })
  }

  async presentToast() {
    const toast = await this.toastController.create({
      message: 'Se agrego el gasto',
       duration:1000
    });
    toast.present();
  }

}


