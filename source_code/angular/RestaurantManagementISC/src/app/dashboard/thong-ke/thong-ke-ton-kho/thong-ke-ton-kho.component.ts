import { Title } from '@angular/platform-browser';
import { Component, OnInit } from '@angular/core';
import { ThongKeService } from 'src/app/services/thong-ke.service';

@Component({
  selector: 'app-thong-ke-ton-kho',
  templateUrl: './thong-ke-ton-kho.component.html',
  styleUrls: ['./thong-ke-ton-kho.component.css']
})
export class ThongKeTonKhoComponent implements OnInit {

  dateTo: Date;
  dateFrom: Date;
  constructor(private titleService: Title, private thongkeService: ThongKeService) { }

  ngOnInit() {
    this.titleService.setTitle('Thống kê tồn kho');
  }

}
