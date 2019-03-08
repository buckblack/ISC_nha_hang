using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestaurantManagementISC.Models.VewModels
{
    public class BaseRespone
    {
        public BaseRespone() { }

        public BaseRespone(object data)
        {
            this.Data = data;
        }

        public int ErrorCode { get; set; }

        public string Message { get; set; }

        public object Data { get; set; }
    }
}
