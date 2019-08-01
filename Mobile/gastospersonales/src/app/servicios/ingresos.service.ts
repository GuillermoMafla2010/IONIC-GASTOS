import { Ingresos } from './../modelos/Ingresos';
import { Injectable, EventEmitter } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class IngresosService {

  private ingresos:Ingresos
  private url="http://localhost:8000/api/ingresos"
  private url1="http://localhost:8000/api/veringreso"
  private _notificarUpdate = new EventEmitter<any>();
  private _notificarPost = new EventEmitter<any>();
  constructor(private http:HttpClient) { }

  get notificarUpdate():EventEmitter<any>{
    return this._notificarUpdate
  }

  get notificarPost():EventEmitter<any>{
    return this._notificarPost
  }

  getIngresos(id:number):Observable<any>{
    return this.http.get<any>(`${this.url}/${id}`)
  }

  postIngresos(ingreso:Ingresos):Observable<any>{
    return this.http.post<any>(`${this.url}`,ingreso)
  }

  getIngresoPorId(id:number):Observable<any>{
    return this.http.get<any>(`${this.url1}/${id}`)
  }

  updateIngreso(ingresos:Ingresos){
    return this.http.put<any>(`${this.url}/${ingresos.id}`,ingresos);
  }

  deleteIngreso(id){
    return this.http.delete<any>(`${this.url}/${id}`)
  }
}
