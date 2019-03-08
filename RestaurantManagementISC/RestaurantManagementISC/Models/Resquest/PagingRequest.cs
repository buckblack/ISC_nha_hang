using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestaurantManagementISC.Models.Resquest
{
    public class PagingRequest
    {
        public int Size { get; set; } = 20;

        public int Page { get; set; } = 1;
    }
}
