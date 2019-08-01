import { IngresosService } from './../../../servicios/ingresos.service';
import { Component, OnInit } from '@angular/core';
import {EditarIngresoPage} from '../editar-ingreso/editar-ingreso.page';
import { ModalController } from '@ionic/angular';
import {Router} from '@angular/router';
import swal from 'sweetalert2'
import { AlertController } from '@ionic/angular';

@Component({
  selector: 'app-ver-ingresos',
  templateUrl: './ver-ingresos.page.html',
  styleUrls: ['./ver-ingresos.page.scss'],
})
export class VerIngresosPage implements OnInit {

  public ingresos=[]
  public total=[]
  public suma=0
  constructor(private ingresoservice:IngresosService,public router:Router,public alertController: AlertController) { }

  ngOnInit() {
    
    this.getIngresos()
    this.ingresoservice.notificarUpdate.subscribe(update=>{
      console.log(update)
      this.ingresos=this.ingresos.map(original=>{
        console.log(original)
        if(update.id==original.id){
          original=update
        }
        return original
      })
    })

    this.ingresoservice.notificarPost.subscribe(post=>{
      this.getIngresos()
    })

    
  }

  getIngresos(){
    
      this.ingresoservice.getIngresos(1).subscribe(x=>{
       this.ingresos=x
       console.log(x)

         this.ingresos.map(x=>{
          this.total.push(x.cantidad_ingreso)
          
          
        }) 

        console.log(this.total)

         for(let i=0;i<this.total.length;i++){
          this.suma=this.suma+this.total[i]
        }
        console.log(this.suma) 
        
       
        
      })

      

      
  }

  async presentAlertConfirm(id) {
    const alert = await this.alertController.create({
      header: 'Eliminar ingreso',
      message: 'El registro se eliminara permanentemente',
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
            console.log('Confirm Okay');
            this.ingresoservice.deleteIngreso(id).subscribe(x=>{
              this.getIngresos()
            })
          }
        }
      ]
    });

    await alert.present();
  }

  async update(id){
    console.log(id)
    this.router.navigate(['tabs/editar-ingresos',id])
    

  }

  delete(id){
    console.log(id)
    this.presentAlertConfirm(id)
    
    
    
  }

}
