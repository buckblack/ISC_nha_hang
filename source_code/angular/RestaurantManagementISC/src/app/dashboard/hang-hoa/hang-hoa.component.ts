import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-hang-hoa',
  templateUrl: './hang-hoa.component.html',
  styleUrls: ['./hang-hoa.component.css']
})
export class HangHoaComponent implements OnInit {

  cke_them = `
  `;
  constructor() { }

  ngOnInit() {
  }

  show(){
    console.log(this.cke_them);
  }
}
