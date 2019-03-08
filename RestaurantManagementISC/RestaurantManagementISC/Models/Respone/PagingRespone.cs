using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestaurantManagementISC.Models.Respone
{
    public class PagingRespone
    {
        public PagingInfo pagingInfo { get; set; }
    }

    public class PagingInfo
    {
        public long TotalRecords { get; set; }

        public int TotalPages { get; set; }

        public int PageSize { get; set; } = 20;

        public int CurrentPage { get; set; } = 1;
    }
}
