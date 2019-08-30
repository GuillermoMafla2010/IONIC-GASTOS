import { AhorrosService } from './../../../servicios/ahorros.service';
import { ActivatedRoute } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { AlertController } from '@ionic/angular';

@Component({
  selector: 'app-ahorros-vergastos',
  templateUrl: './ahorros-vergastos.page.html',
  styleUrls: ['./ahorros-vergastos.page.scss'],
})
export class AhorrosVergastosPage implements OnInit {

  private gastos
  constructor(private ar:ActivatedRoute,private ahorroservice:AhorrosService,public alertController: AlertController) { }

  ngOnInit() {
    this.getGastos()
    
  }

  getGastos(){
    this.ar.params.subscribe(x=>{
      console.log(x.id)
      this.ahorroservice.getBancosPorId(x.id).subscribe(y=>{
          console.log(y)
          y.map(z=>{
            console.log(z)
            this.ahorroservice.getCgastos(z.cuenta_id).subscribe(x=>{
              this.gastos=x
              console.log(this.gastos)
  
            })
          })
          
      })
    })

  }

  async delete(id) {
    const alert = await this.alertController.create({
      header: 'Seguro deseas eliminar el ingreso',
      message: 'No se podra revertir esta accion',
      buttons: [
        {
          text: 'Cancelar',
          role: 'cancel',
          cssClass: 'secondary',
          handler: (blah) => {
            console.log('Confirm Cancel: blah');
          }
        }, {
          text: 'Aceptar',
          handler: () => {
            this.ahorroservice.eliminarCgasto(id).subscribe(x=>{
              console.log("Eliminado")
              this.getGastos()
              this.ahorroservice.notificargastodelete.emit(this.gastos)
            })
          }
        }
      ]
    });

    await alert.present();
  }


}
