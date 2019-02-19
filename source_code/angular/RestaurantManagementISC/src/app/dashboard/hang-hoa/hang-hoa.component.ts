import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-hang-hoa',
  templateUrl: './hang-hoa.component.html',
  styleUrls: ['./hang-hoa.component.css']
})
export class HangHoaComponent implements OnInit {

  cke_them = `
  `;
  constructor(private titleService: Title) { }

  ngOnInit() {
    this.titleService.setTitle('Sản phẩm');
  }

  show(){
    console.log(this.cke_them);
  }
}
