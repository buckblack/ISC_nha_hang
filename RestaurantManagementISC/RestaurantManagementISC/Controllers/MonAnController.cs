using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting.Internal;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RestaurantManagementISC.Models;
using RestaurantManagementISC.Models.VewModels;

namespace RestaurantManagementISC.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MonAnController : ControllerBase
    {
        private readonly RestaurantContext _context;
        private readonly HostingEnvironment _hostingEnvironment;
        public MonAnController(RestaurantContext context,HostingEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;
        }

        // GET: api/MonAn
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MonAn>>> GetMonAns()
        {
            return await _context.MonAns.Where(x => x.trangthai != "xóa").Select(x => new MonAn {
                Id = x.Id,
                hinhanh = Models.Ultis.Helper.getUrl(Request) + x.hinhanh,
                dongia=x.dongia,
                tenmonan=x.tenmonan,
                noidung=x.noidung,
                trangthai=x.trangthai,
                LoaiMonAn=x.LoaiMonAn,
                id_loaimonan=x.id_loaimonan,
            }).ToListAsync();
        }

        // GET: api/MonAn/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MonAn>> GetMonAn(int id)
        {
            var monAn = await _context.MonAns.Where(x=>x.Id==id).Include(x => x.LoaiMonAn).AsNoTracking().FirstOrDefaultAsync();

            if (monAn == null)
            {
                return NotFound();
            }
            monAn.hinhanh = Models.Ultis.Helper.getUrl(Request) + monAn.hinhanh;
            return monAn;
        }

        //tìm
        [HttpGet("tim")]
        public async Task<ActionResult<IEnumerable<MonAn>>> GetTimNguyenLieu([FromQuery] string q)
        {
            return await _context.MonAns.Where(x => x.tenmonan.Contains(q)).ToListAsync();
        }


        //Put: api/MonAn/TinhTrang/5
        [HttpPut("tinhtrang/{idMon}")]
        public async Task<IActionResult> PutTinhTrangMonAn (MonAn monAn, int idMon)
        {
            var a = await _context.MonAns.FindAsync(idMon);
            if (a == null)
            {
                return NotFound();
            }
            a.trangthai = monAn.trangthai;
            _context.MonAns.Update(a);
            await _context.SaveChangesAsync();
            return Ok(a);
        }

        // PUT: api/MonAn/5
        [HttpPut("{id}")]
        public async Task<ActionResult<BaseRespone>> PutMonAn(int id ,[FromForm] MonAnRequest monAn)
        {
            //lấy dữ liệu cũ của món ăn
            var monan = await _context.MonAns.FindAsync(id);

            if (monan == null)
            {
                return BadRequest();
            }

            if (monAn.File != null)
            {
                var uploadFilesPath = Path.Combine(_hostingEnvironment.WebRootPath, "Data\\sanpham");

                if (!Directory.Exists(uploadFilesPath))
                {
                    Directory.CreateDirectory(uploadFilesPath);
                }
                //lấy đường dẫn file cũ
                string oldImageName = _hostingEnvironment.WebRootPath + "\\Data\\sanpham\\" + monan.hinhanh;

                string newFileName = id + "_" + monAn.File.FileName;

                //lấy đường dẫn file mới
                string path = _hostingEnvironment.WebRootPath + "\\Data\\sanpham\\" + newFileName;

                if (monan.hinhanh != "")
                {
                    if (System.IO.File.Exists(oldImageName))
                    {
                        System.IO.File.Delete(oldImageName);
                    }
                }

                using (var stream = new FileStream(path, FileMode.Create))
                {
                    monAn.File.CopyTo(stream);
                    monan.hinhanh = newFileName;
                }
            }
            _context.SaveChanges();

            monan.tenmonan = monAn.tenmonan;
            monan.dongia = monAn.dongia;
            monan.trangthai = monAn.trangthai;
            monan.noidung = monAn.noidung;
            monan.id_loaimonan = monAn.id_loaimonan;          
            _context.SaveChanges();

            return new BaseRespone()
            {
                ErrorCode = 0
            };
        }

        // POST: api/MonAn
        [HttpPost]
        public async Task<ActionResult<BaseRespone>> PostMonAn([FromForm]MonAn monAn)
        {
            try
            {
                var file = monAn.File;
                _context.MonAns.Add(monAn);
                await _context.SaveChangesAsync();

                if (file != null)
                {
                    string newFileName = monAn.Id + "_" + file.FileName;
                    string path = _hostingEnvironment.WebRootPath + "\\Data\\sanpham\\" + newFileName;

                    using (var stream = new FileStream(path, FileMode.Create))
                    {
                        file.CopyTo(stream);
                        monAn.hinhanh = newFileName;
                        _context.Entry(monAn).Property(x => x.hinhanh).IsModified = true;
                        _context.SaveChanges();
                    }
                }
                return new BaseRespone(CreatedAtAction("Get", new { id = monAn.Id }, monAn));
            }
            catch
            {
                return new BaseRespone { ErrorCode = 1 ,Message="Lỗi"};
            }
        }
        // DELETE: api/MonAn/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<MonAn>> DeleteMonAn(int id)
        {
            var monAn = await _context.MonAns.FindAsync(id);
            if (monAn == null)
            {
                return NotFound();
            }

            _context.MonAns.Remove(monAn);
            await _context.SaveChangesAsync();

            return monAn;
        }

        private bool MonAnExists(int id)
        {
            return _context.MonAns.Any(e => e.Id == id);
        }
    }
}
