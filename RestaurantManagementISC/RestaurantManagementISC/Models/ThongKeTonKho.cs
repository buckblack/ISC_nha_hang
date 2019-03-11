﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace RestaurantManagementISC.Models
{
    [Table("tmp_thong_ke_ton_kho")]
    public class ThongKeTonKho
    {
        [Key]
        public int id_nguyenlieu { get; set; }
        public string tennguyenlieu { get; set; }
        public string dvt { get; set; }
        public Nullable<decimal> tondau { get; set; }
        public Nullable<decimal> xuat { get; set; }
        public Nullable<decimal> nhap { get; set; }
        public Nullable<decimal> toncuoi { get; set; }
    }
}
