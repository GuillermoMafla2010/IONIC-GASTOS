import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DeudaService } from 'src/app/servicios/deuda.service';


@Component({
  selector: 'app-deudas',
  templateUrl: './deudas.page.html',
  styleUrls: ['./deudas.page.scss'],
})
export class DeudasPage implements OnInit {

  private deuda:[]
  constructor(private router:Router,private deudaservice:DeudaService) { }

  ngOnInit() {
    this.getDeudas()
    this.deudaservice.notificarupload.subscribe(()=>{
      this.getDeudas()
    })
  }

  getDeudas(){
    this.deudaservice.getDeudasPorId(1).subscribe(x=>{
      this.deuda=x
      console.log(x)
    })

    
  
  }

  
  creardeuda(){
    this.router.navigate(['tabs/crear-deuda']);
  }

}
