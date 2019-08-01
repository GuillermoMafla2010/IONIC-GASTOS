import { Router, ActivatedRoute } from '@angular/router';
import { GastosService } from './../../../servicios/gastos.service';

import { Component, OnInit } from '@angular/core';
import { ToastController } from '@ionic/angular';
import { AlertController } from '@ionic/angular';

@Component({
  selector: 'app-ver-gastos',
  templateUrl: './ver-gastos.page.html',
  styleUrls: ['./ver-gastos.page.scss'],
})
export class VerGastosPage implements OnInit {

  public gastos=[]
  constructor(private gastoservice:GastosService,
    private router:Router,
    private activatedroute:ActivatedRoute,
    public toastController: ToastController,
    public alertController: AlertController) { }

  ngOnInit() {
    this.getGastos()
    this.gastoservice.notificarUpdate.subscribe(update=>{
      console.log(update)
      this.gastos=this.gastos.map(original=>{
        console.log(original)
        if(update.id==original.id){
          original=update
        }
        return original
      })
    })

    this.gastoservice.notificarPost.subscribe(post=>{
      console.log(post)
     this.getGastos()
      
      
    })
  }


  async presentAlertConfirm(id) {
    const alert = await this.alertController.create({
      header: 'Eliminar Gasto',
      message: 'Se eliminara permanentemente de la lista',
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
            this.gastoservice.deleteGasto(id).subscribe(x=>{
              console.log("Eliminado Gasto")
              this.getGastos()
            })
          }
        }
      ]
    });

    await alert.present();
  }



  getGastos(){
    this.gastoservice.getGastos(1).subscribe(x=>{
      this.gastos=x
      console.log(this.gastos)
     
    })
  }

  update(id){
    console.log(id)
    this.router.navigate(['tabs/editar-gastos',id])

  }
  
  delete(id){
    console.log(id)
    this.presentAlertConfirm(id)
    
    
  }

}
