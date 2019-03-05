using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace RestaurantManagementISC.Models
{
    [Table("tmp_so_luong_ban_duoc")]
    public class ThongKeSoLuong
    {
        [Key]
        public string khoa { get; set; }
        public string ten_mon { get; set; }
        public DateTime ngay { get; set; }
        public int so_luong { get; set; }
    }
}
