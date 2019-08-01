import { UsuariosService } from './../../servicios/usuarios.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-usuarios',
  templateUrl: './usuarios.page.html',
  styleUrls: ['./usuarios.page.scss'],
})
export class UsuariosPage implements OnInit {

  public usuarios
  public totalgastos=[]
   public parcialgastos=[]
  public totalingresos=[]
  public parcialingresos=[]
  public sumagastos=0
  public sumaingresos=0
  constructor(private usuarioservice:UsuariosService) { }

  ngOnInit() {
    this.getUsuarios()
  }

 getUsuarios(){
    this.usuarioservice.getUsuariosPorId(1).subscribe(x=>{
      x.map(y=>{this.usuarios=y;
        this.totalgastos=y.gastos;
        this.totalingresos=y.ingresos})

        this.totalgastos.map(x=>{
         this.parcialgastos.push(x.cantidad_gasto)
        })

        this.totalingresos.map(x=>{
          this.parcialingresos.push(x.cantidad_ingreso)
         })

         for(let i=0;i<this.parcialgastos.length;i++){
          this.sumagastos=this.sumagastos+this.parcialgastos[i]
    
        }


        for(let i=0;i<this.totalingresos.length;i++){
          this.sumaingresos=this.sumaingresos+this.parcialingresos[i]
    
        }
     
     
      console.log(this.usuarios)
      console.log(this.totalgastos)
      console.log(this.totalingresos)
      console.log(this.parcialgastos)
      console.log(this.parcialingresos)
      console.log(this.sumagastos)
      console.log(this.sumaingresos)
    })




    
    

    console.log(this.totalgastos)

   
   


}

}
