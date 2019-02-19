import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  message = '';
  email = '';
  password = '';
  constructor(private titleService: Title, private http: HttpClient, private router: Router) { }

  ngOnInit() {
    this.titleService.setTitle('Đăng nhập');
  }

  login() {
    const param = {
      email: this.email,
      password: this.password
    };
    this.http.post('https://localhost:44384/api/nhanvien/login', param)
      .subscribe(result => {
        if (result['id'] === 0) {
          this.message = "Sai tên đăng nhập hoặc mật khẩu";
        } else {
          if (result['trangthai'] === false) {
            this.message = "Tài khoản này đã bị khóa";
          } else {
            this.message = '';
            this.router.navigate(['/dashboard']);
          }
        }
      });
  }

}
