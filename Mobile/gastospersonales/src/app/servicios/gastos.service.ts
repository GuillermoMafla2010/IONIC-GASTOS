import { Gastos } from './../modelos/Gastos';
import { Injectable, EventEmitter } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';



@Injectable({
  providedIn: 'root'
})
export class GastosService {
  
  private url="http://localhost:8000/api/gastos"
  private url1="http://localhost:8000/api/vergasto"
  private _notificarUpdate = new EventEmitter<any>();
  private _notificarPost = new EventEmitter<any>();

  constructor(private http:HttpClient) { }
  private gasto:Gastos

  get notificarUpdate():EventEmitter<any>{
    return this._notificarUpdate
  }

  get notificarPost():EventEmitter<any>{
    return this._notificarPost
  }


  getGastos(id:number):Observable<any>{
    return this.http.get<any>(`${this.url}/${id}`)

  }

  getGastoIndividual(id){
    return this.http.get<any>(`${this.url1}/${id}`);
  }

  updateGasto(gasto:Gastos,id:number):Observable<any>{
    return this.http.put<any>(`${this.url}/${id}`,gasto);
  }

  postGasto(gasto:Gastos):Observable<any>{
    return this.http.post<any>(`${this.url}`,gasto)
  }

  deleteGasto(id){
    return this.http.delete<any>(`${this.url}/${id}`)
  }


}
