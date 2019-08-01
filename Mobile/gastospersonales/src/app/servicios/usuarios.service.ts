import { Injectable } from '@angular/core';
import {Observable} from 'rxjs';
import {HttpClient} from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class UsuariosService {

  private url="http://localhost:8000/api/users"
  constructor(private http:HttpClient) { }

  getUsuariosPorId(id:number):Observable<any>{
    return this.http.get<any>(`${this.url}/${id}`);
  }


}
