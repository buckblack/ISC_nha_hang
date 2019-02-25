import { MonanList, MonanInfo, ThanhPhan, NguyenLieu, ListLoaimonanInfo } from './../../services/hang-hoa.service';
import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { HangHoaService } from 'src/app/services/hang-hoa.service';
import { LoaimonanInfo } from 'src/app/services/hoa-don.service';


@Component({
  selector: 'app-hang-hoa',
  templateUrl: './hang-hoa.component.html',
  styleUrls: ['./hang-hoa.component.css']
})
export class HangHoaComponent implements OnInit {
  cke_them = ``;
  tp_idmonan: number;
  sl_tp_up: number;
  sl_tp_down: number;
  ip_tp_soluong: number;
  detail: MonanInfo;
  sanphams: MonanList;
  thanhphans: ThanhPhan;
  nguyenlieus: NguyenLieu[];
  hangHoaMoi: MonanInfo ={} as MonanInfo; //Hàng hóa để thêm mới
  loaiHHs: ListLoaimonanInfo; //list id mã hàng hóa
  constructor(private titleService: Title, private monanService: HangHoaService) { }
  ngOnInit() {
    this.titleService.setTitle('Sản phẩm');
    this.monanService.getAllMonAn().subscribe(result => {
      this.sanphams = result;
    });

  }

  tp_uptodown() {
    if (this.sl_tp_up === undefined) {
      alert("Chưa chọn nguyên liệu");
      return;
    }
    if (this.ip_tp_soluong === undefined || this.ip_tp_soluong === null || this.ip_tp_soluong === 0) {
      alert("Số lượng nguyên liệu không hợp lệ");
      return;
    }
    const param = {
      "soluong": this.ip_tp_soluong,
      "id_nguyenlieu": this.sl_tp_up,
      "id_monan": this.tp_idmonan
    }
    this.monanService.ThemCongThuc(param).subscribe(result => {
      this.getThanhphan(this.tp_idmonan);//load lại thành phần nguyên liệu sau khi thêm
    });
  }

  tp_downtoup() {
    if (this.sl_tp_down === undefined) {
      alert("Chưa chọn nguyên liệu");
      return;
    }
    this.monanService.XoaCongThuc(this.sl_tp_down).subscribe(result => {
      this.getThanhphan(this.tp_idmonan);//load lại thành phần nguyên liệu sau khi xóa
    });
  }

  click_detail(id) {
    this.monanService.getMonAn(id).subscribe(result => {
      this.tp_idmonan = result.id;
      this.detail = result;
    });
  }
  getThanhphan(idmonan) {
    this.monanService.getThanhPhanHienTai(idmonan).subscribe(result => {
      this.thanhphans = result;
    });
  }

  TimNguyenLieu(query) {
    this.monanService.TimNguyenLieu(query).subscribe(result => {
      this.nguyenlieus = result;
    });
  }

  themHangHoa(){
    //console.log(this.hangHoaMoi);
    const param = {
      tenmonan: this.hangHoaMoi.tenmonan,
      dongia: this.hangHoaMoi.dongia,
      hinhanh: this.hangHoaMoi.hinhanh,
      trangthai: this.hangHoaMoi.trangthai,
      noidung: this.cke_them,
      id_loaimonan: this.hangHoaMoi.id_loaimonan
    };
    this.monanService.ThemHangHoa(param).subscribe(result => {

    });
    //console.log(param);
  }

  show() {
    console.log(this.cke_them);

  }

  handleUpload(event){
    this.hangHoaMoi.hinhanh = event.target.files[0].name;
   }

   getAllHangHoa(){
    this.monanService.getAllLoaiHangHoa().subscribe(result => {
      this.loaiHHs = result;
      console.log(this.loaiHHs.loaimonan)
    });
   }
}
