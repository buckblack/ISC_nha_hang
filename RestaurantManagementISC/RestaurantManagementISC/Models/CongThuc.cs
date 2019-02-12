using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace RestaurantManagementISC.Models
{
    [Table("CongThuc")]
    public class CongThuc
    {
        [Column("ct_soluong")]
        public float soluong { get; set; }

        public int id_nguyenlieu { get; set; }

        public int id_monan { get; set; }

        [ForeignKey("id_monan")]
        public virtual MonAn MonAn { get; set; }

        [ForeignKey("id_nguyenlieu")]
        public virtual NguyenLieu NguyenLieu { get; set; }
    }
}
