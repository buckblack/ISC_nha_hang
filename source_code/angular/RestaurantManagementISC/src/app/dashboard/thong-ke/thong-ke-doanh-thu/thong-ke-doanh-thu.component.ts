import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { ThongKeService, DoanhthusRespone, Doanhthu } from 'src/app/services/thong-ke.service';

@Component({
  selector: 'app-thong-ke-doanh-thu',
  templateUrl: './thong-ke-doanh-thu.component.html',
  styleUrls: ['./thong-ke-doanh-thu.component.css']
})
export class ThongKeDoanhThuComponent implements OnInit {
  Doanhthus: Doanhthu[];
  dateTo: Date;
  dateFrom: Date;
  constructor(private titleService: Title, private thongkeService: ThongKeService) { }

  ngOnInit() {
    this.titleService.setTitle('Thống kê doanh thu');
  }
  loadData() {
    const param = {
      dateFrom: this.dateFrom,
      dateTo: this.dateTo
    };
    this.thongkeService.getDoanhThu(param).subscribe(result => {
      this.Doanhthus = result.data;
      console.log(result);
    });
  }
  click() {
    this.loadData();
  }

}
