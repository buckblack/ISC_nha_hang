import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
export interface Doanhthu {
  ngay: Date;
  thu: number;
  chi: number;
}
export interface DoanhthusRespone {
  errorCode: number;
  message: string;
  data: Doanhthu[];
}
export interface SoLuong {
  khoa: string;
  ten_mon: string;
  ngay: Date;
  so_luong: number;
}
export interface SoLuongRespone {
  errorCode: number;
  message: string;
  data: SoLuong[];
}
@Injectable({
  providedIn: 'root'
})
export class ThongKeService {

  constructor(private api: ApiService, private http: HttpClient) { }
  public getDoanhThu(data): Observable<DoanhthusRespone> {
    return this.http.post<DoanhthusRespone>(this.api.apiUrl.doanhthu, data);
  }
  public getSoLuong(param): Observable<SoLuongRespone> {
    return this.http.post<SoLuongRespone>(this.api.apiUrl.thongkesoluong, param);
  }
}
