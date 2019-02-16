﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RestaurantManagementISC.Models;

namespace RestaurantManagementISC.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CongThucController : ControllerBase
    {
        private readonly RestaurantContext _context;

        public CongThucController(RestaurantContext context)
        {
            _context = context;
        }

        // GET: api/CongThuc
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CongThuc>>> GetCongThucs()
        {
            return await _context.CongThucs.ToListAsync();
        }

        // GET: api/CongThuc/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CongThuc>> GetCongThuc(int id)
        {
            var congThuc = await _context.CongThucs.FindAsync(id);

            if (congThuc == null)
            {
                return NotFound();
            }

            return congThuc;
        }

        // PUT: api/CongThuc/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCongThuc(int id, CongThuc congThuc)
        {
            if (id != congThuc.Id)
            {
                return BadRequest();
            }

            _context.Entry(congThuc).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CongThucExists(id))
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

        // POST: api/CongThuc
        [HttpPost]
        public async Task<ActionResult<CongThuc>> PostCongThuc(CongThuc congThuc)
        {
            _context.CongThucs.Add(congThuc);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCongThuc", new { id = congThuc.Id }, congThuc);
        }

        // DELETE: api/CongThuc/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<CongThuc>> DeleteCongThuc(int id)
        {
            var congThuc = await _context.CongThucs.FindAsync(id);
            if (congThuc == null)
            {
                return NotFound();
            }

            _context.CongThucs.Remove(congThuc);
            await _context.SaveChangesAsync();

            return congThuc;
        }

        private bool CongThucExists(int id)
        {
            return _context.CongThucs.Any(e => e.Id == id);
        }
    }
}