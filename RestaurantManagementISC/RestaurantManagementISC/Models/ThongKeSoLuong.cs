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
        public int id_mon { get; set; }
        public string ma_ten { get; set; }
        [Key]
        public DateTime ngay { get; set; }
        public int soluong { get; set; }
    }
}
