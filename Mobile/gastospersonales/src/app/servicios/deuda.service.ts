import { Injectable,EventEmitter } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import { Deuda } from '../modelos/Deuda';


@Injectable({
  providedIn: 'root'
})
export class DeudaService {

  private deuda:Deuda;
  private url="http://localhost:8000/api/deudas"
  private  _notificarupload=new EventEmitter <any>();
  constructor(private http:HttpClient) { }

  get notificarupload():EventEmitter<any>{
    return this._notificarupload;
  }

  getDeudas():Observable<any>{
      return this.http.get<any>(this.url);
  }

  getDeudasPorId(id:number):Observable<any>{
    return this.http.get<any>(this.url);
}

  postDeudas(deuda:Deuda):Observable<any>{
    return this.http.post<any>(this.url,deuda);
  }

}
