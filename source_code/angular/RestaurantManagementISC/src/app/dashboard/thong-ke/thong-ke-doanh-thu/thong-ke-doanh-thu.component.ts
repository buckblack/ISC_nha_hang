import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { ThongKeService, DoanhthusRespone, Doanhthu, TongThuChi } from 'src/app/services/thong-ke.service';
import { Chart } from 'angular-highcharts';

@Component({
  selector: 'app-thong-ke-doanh-thu',
  templateUrl: './thong-ke-doanh-thu.component.html',
  styleUrls: ['./thong-ke-doanh-thu.component.css']
})
export class ThongKeDoanhThuComponent implements OnInit {
  Doanhthus: Doanhthu[];
  dateTo: Date;
  dateFrom;
  TongThuChi: TongThuChi;
  chart: Chart;

  constructor(private titleService: Title, private thongkeService: ThongKeService) { }

  ngOnInit() {
    this.titleService.setTitle('Thống kê doanh thu');
    const d = new Date().toLocaleDateString('en-GB');
    this.dateFrom = d//'2019-03-12';
    console.log(d);
    
  }

  loadData() {
    const param = {
      dateFrom: this.dateFrom,
      dateTo: this.dateTo
    };
    this.thongkeService.getDoanhThu(param).subscribe(result => {
      this.thongkeService.postThuChi(param).subscribe(thuchi => {
        this.Doanhthus = result.data;
        this.TongThuChi = thuchi;
        const arrthu = [];
        const arrchi = [];
        const arrngay = [];
        result.data.forEach(element => {
          arrthu.push(element.thu);
          arrchi.push(element.chi);
          arrngay.push((element.ngay));
        });
        this.chart = new Chart({
          lang: {
            numericSymbols: [` Ngàn`, ` Triệu`],
            numericSymbolMagnitude: 1000,
            decimalPoint: ',', ///phân cách thập phân
            thousandsSep: '.' ///hàng ngàn
          },
          chart: {
            style: {
              fontFamily: `tahoma`, /// chỉnh font cho chữ thống dc đúng
              fontSize: '16px'
            },
            type: 'column',
            plotBorderWidth: 1,
          },
          title: {
            text: 'Thống kê doanh thu',
            align: 'center',
            style: {
              color: 'red',
              fontWeight: 'bold',
              fontSize: '1.5rem'
            },
            y: 20,
          },
          subtitle: {
            text: `Từ ${this.dateFrom} đến ${this.dateTo}`
          },
          xAxis: {
            categories: arrngay
          },
          yAxis: {
            title: {
              text: 'Số lượng thu chi',

              style: {
                color: 'blue',
                fontWeight: 'bold',
                fontSize: '1rem'
              }

            }
          },
          credits: {
            enabled: false
          },
          series: [
            {
              name: 'Thu',
              data: arrthu,
              color: 'red'
            } as any,
            {
              name: 'Chi',
              data: arrchi,
              color: 'green'
            } as any
          ]
        });
      });


    });
  }
  click() {
    this.loadData();
  }


}
