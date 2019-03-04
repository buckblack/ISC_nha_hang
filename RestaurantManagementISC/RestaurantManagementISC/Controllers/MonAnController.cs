using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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

        public MonAnController(RestaurantContext context)
        {
            _context = context;
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
        public async Task<IActionResult> PutMonAn(int id, MonAn monAn)
        {
            if (id != monAn.Id)
            {
                return BadRequest();
            }

            _context.Entry(monAn).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MonAnExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/MonAn
        [HttpPost]
        //public async Task<ActionResult<MonAn>> PostMonAn(MonAn monAn)
        //{
        //    _context.MonAns.Add(monAn);
        //    await _context.SaveChangesAsync();

        //    return CreatedAtAction("GetMonAn", new { id = monAn.Id }, monAn);
        //}
        public async Task<ActionResult<BaseRespone>> PostMonAn(MonAn monAn)
        {
            try
            {
                _context.MonAns.Add(monAn);
                await _context.SaveChangesAsync();
                return new BaseRespone(monAn);
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
