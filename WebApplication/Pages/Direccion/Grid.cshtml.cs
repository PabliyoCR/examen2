using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Entity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WBL;

namespace WebApplication.Pages
{
    public class GridModel : PageModel
    {
        private readonly IDireccionService direccionService;

        public GridModel(IDireccionService direccionService)
        {
            this.direccionService = direccionService;
        }

        public IEnumerable<DireccionEntity> GridList { get; set; } = new List<DireccionEntity>();


        public async Task<IActionResult> OnGet()
        {
            try
            {
                GridList = await direccionService.Get();


                return Page();


            }
            catch (Exception ex)
            {

                return Content(ex.Message);
            }
        }

        public async Task<JsonResult> OnDeleteEliminar(int id)
        {
            try
            {
                var result = await direccionService.Delete(new()
                {
                    IdDireccion = id
                });



                return new JsonResult(result);
            }
            catch (Exception ex)
            {

                return new JsonResult(new DBEntity { CodeError = ex.HResult, MsgError = ex.Message });
            }

        }
    }
}

