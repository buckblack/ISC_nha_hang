using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace RestaurantManagementISC.Models.Ultis
{
    public class Helper
    {
        public static string getUrl(HttpRequest req)
        {
            return "http" + (req.IsHttps ? "s" : "")+"://" +req.Host.ToString()+"/data/sanpham/";
        }
        public static string GenHash(string input)
        {
            return string.Join("", new SHA1Managed().ComputeHash(Encoding.UTF8.GetBytes(input)).Select(x => x.ToString("X2")).ToArray());
        }

    }
}
