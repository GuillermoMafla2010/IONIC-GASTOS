import { Router } from '@angular/router';
import { AhorrosService } from './../../../servicios/ahorros.service';
import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-ahorros',
  templateUrl: './ahorros.page.html',
  styleUrls: ['./ahorros.page.scss'],
})
export class AhorrosPage implements OnInit {

 
   bancos:any
   //ingresos:any
   //gastos:any
   info=[]
  constructor(private ahorroservice:AhorrosService,private router:Router) { }

  ngOnInit() {
    this.getAhorros()
   
   
  }

  getAhorros(){
    this.ahorroservice.notificarupload.subscribe(()=>{
      if(this.info.length>1){
        this.info=[]
        this.getAhorros()
      }})

      this.ahorroservice.notificargastoupload.subscribe(()=>{
        if(this.info.length>1){
          this.info=[]
          this.getAhorros()
        }})

      this.ahorroservice.notificardelete.subscribe(()=>{
        if(this.info.length>1){
          this.info=[]
          this.getAhorros()
        }
      
    })

    this.ahorroservice.notificargastodelete.subscribe(()=>{
      if(this.info.length>1){
        this.info=[]
        this.getAhorros()
      }
    
  })


    

     
    this.ahorroservice.getCuentas().subscribe(x=>{
       this.bancos=x.datos
       console.log(this.bancos)
       this.bancos.map(z=>{
        this.ahorroservice.getCuentasPorId(z.id).subscribe(a=>{
          //console.log(a)
          this.info.push(a)
         
          
          
        })

        
       
        
       })
      
 
        
})



  }  // Fin del metodo getAhorros



  veropciones(id:number){
    console.log(id)
    this.router.navigate(['tabs/opcionesahorros',id]);
  }



}//Fin de la clase