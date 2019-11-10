using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShopTree.Models;

namespace ShopTree.Areas.Admin.Controllers
{
    public class LevelsController : Controller
    {
        private ShopTreeEntities db = new ShopTreeEntities();

        // GET: Admin/Levels
        public async Task<ActionResult> Index()
        {
            return View(await db.Levels.ToListAsync());
        }

        // GET: Admin/Levels/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Level level = await db.Levels.FindAsync(id);
            if (level == null)
            {
                return HttpNotFound();
            }
            return View(level);
        }

        // GET: Admin/Levels/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Levels/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Name")] Level level)
        {
            if (ModelState.IsValid)
            {
                db.Levels.Add(level);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(level);
        }

        // GET: Admin/Levels/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Level level = await db.Levels.FindAsync(id);
            if (level == null)
            {
                return HttpNotFound();
            }
            return View(level);
        }

        // POST: Admin/Levels/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name")] Level level)
        {
            if (ModelState.IsValid)
            {
                db.Entry(level).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(level);
        }

        // GET: Admin/Levels/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Level level = await db.Levels.FindAsync(id);
            if (level == null)
            {
                return HttpNotFound();
            }
            return View(level);
        }

        // POST: Admin/Levels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Level level = await db.Levels.FindAsync(id);
            db.Levels.Remove(level);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
