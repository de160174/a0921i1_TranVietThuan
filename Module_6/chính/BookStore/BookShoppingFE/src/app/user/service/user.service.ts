import { Injectable } from '@angular/core';
import {Observable} from 'rxjs';
import {HttpClient} from '@angular/common/http';
import {environment} from '../../../environments/environment';

const API_URL = `${environment.url}` + '/user';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  getInfo(token: string): Observable<any> {
    return this.http.get<any>(API_URL + '/getInfoFromToken?token=' + token);
  }
}
