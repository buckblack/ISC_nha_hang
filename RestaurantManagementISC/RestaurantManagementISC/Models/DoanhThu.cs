using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace RestaurantManagementISC.Models
{
    [Table("tmp_thu_chi")]
    public class DoanhThu
    {
        [Key]
        public DateTime ngay { get; set; } 

        public Nullable<double> thu { get; set; }

        public Nullable<double> chi { get; set; }

    }
}
