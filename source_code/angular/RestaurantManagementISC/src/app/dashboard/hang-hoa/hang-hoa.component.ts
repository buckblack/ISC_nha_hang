import { MonanList, MonanInfo, ThanhPhan, NguyenLieu, ListLoaimonanInfo } from './../../services/hang-hoa.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { HangHoaService } from 'src/app/services/hang-hoa.service';
import { ModalDirective } from 'ngx-bootstrap';


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
  hangHoaMoi: MonanInfo = {} as MonanInfo; //Hàng hóa để thêm mới
  loaiHHs: ListLoaimonanInfo; //list id mã hàng hóa
  id_monan: number;
  trangthai: string;
  @ViewChild('modalAddNew') modalAddNew: ModalDirective;
  @ViewChild('modalDetail') modalDetail: ModalDirective;
  @ViewChild('modalcomfirm') modalcomfirm: ModalDirective;
  constructor(private titleService: Title, private monanService: HangHoaService) { }
  ngOnInit() {
    this.titleService.setTitle('Sản phẩm');
    this.loadData();

  }
  loadData() {
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

  themHangHoa() {
    const formData: FormData = new FormData();
    formData.append('tenmonan', this.hangHoaMoi.tenmonan);
    formData.append('dongia', this.hangHoaMoi.dongia.toString());
    formData.append('file', this.hangHoaMoi.hinhanh);
    formData.append('trangthai', this.hangHoaMoi.trangthai);
    formData.append('noidung', this.cke_them);
    formData.append('id_loaimonan', this.hangHoaMoi.id_loaimonan.toString());

    this.monanService.ThemHangHoa(formData).subscribe(result => {
      if (result['errorCode'] === 1) {
        alert('Lỗi');
        return;
      }
      this.modalAddNew.hide();
      alert('Thêm thành công');
    });

  }


  handleUpload(event) {
    this.hangHoaMoi.hinhanh = event.target.files[0];
  }

  getAllHangHoa() {
    this.modalAddNew.show();
    this.monanService.getAllLoaiHangHoa().subscribe(result => {
      this.loaiHHs = result;
    });
  }

  updateTrangThai(event, id) {
    event.preventDefault();
    this.monanService.getMonAn(id).subscribe(res => {
      this.id_monan = res.id;
      this.trangthai = res.trangthai;
      console.log(this.id_monan);
      if (this.trangthai === 'đang kinh doanh') {
        const param = {
          trangthai: 'ngừng kinh doanh',
        };
        this.monanService.updateTinhTrangMonAn(param, this.id_monan).subscribe(result => {
          console.log(result);
          if (document.getElementById('btn-tinhtrang').classList.contains('btn-danger')) {
            document.getElementById('btn-tinhtrang').classList.remove('btn-danger');
          }
          document.getElementById('btn-tinhtrang').classList.add('btn-success');

        });
      } else {
        const param = {
          trangthai: 'đang kinh doanh'
        };
        this.monanService.updateTinhTrangMonAn(param, this.id_monan).subscribe(res => {
          console.log(res);
          if (document.getElementById('btn-tinhtrang').classList.contains('btn-success')) {
            document.getElementById('btn-tinhtrang').classList.remove('btn-success');
          }
          document.getElementById('btn-tinhtrang').classList.add('btn-danger');

        });
      }
    });
    this.modalDetail.hide();
    this.loadData();
  }
  deleteHangHoa_confirm(event) {
    event.preventDefault();
    this.modalDetail.hide();
    this.modalcomfirm.show();
  }

  deleteHangHoa(id) {
    this.monanService.getMonAn(id).subscribe(res1 => {
      this.id_monan = res1.id;
      this.trangthai = res1.trangthai;
      const param = {
        trangthai: 'xóa'
      };
      this.monanService.updateTinhTrangMonAn(param, this.id_monan).subscribe(kq => {
        this.loadData();
      });
    });
    this.modalcomfirm.hide();
  }
}
