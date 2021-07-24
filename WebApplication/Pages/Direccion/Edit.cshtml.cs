using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Entity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WBL;
using System.Diagnostics;

namespace WebApplication.Pages.Direccion
{
    public class EditModel : PageModel
    {
        private readonly IDireccionService direccionService;
        private readonly IPersonaService personaService;
        private readonly ICatalogoProvinciaService catalogoProvinciaService;
        private readonly ICatalogoCantonService catalogoCantonService;
        private readonly ICatalogoDistritoService catalogoDistritoService;

        public EditModel(IDireccionService direccionService, IPersonaService personaService, ICatalogoProvinciaService catalogoProvinciaService, ICatalogoCantonService catalogoCantonService, ICatalogoDistritoService catalogoDistritoService)
        {
            this.direccionService = direccionService;
            this.personaService = personaService;
            this.catalogoProvinciaService = catalogoProvinciaService;
            this.catalogoCantonService = catalogoCantonService;
            this.catalogoDistritoService = catalogoDistritoService;

        }

       

        [BindProperty]
        [FromBody]
        public DireccionEntity Entity { get; set; } = new DireccionEntity();

        public IEnumerable<CatalogoProvinciaEntity> ProvinciaLista { get; set; } = new List<CatalogoProvinciaEntity>();
        public IEnumerable<PersonaEntity> PersonaLista { get; set; } = new List<PersonaEntity>();

        [BindProperty(SupportsGet = true)]
        public int? id { get; set; }

        public async Task<IActionResult> OnGet()
        {
            try
            {
                if (id.HasValue)
                {
                    Entity = await direccionService.GetById(new() { IdDireccion = id });
                }

               PersonaLista = await personaService.GetLista();
               ProvinciaLista = await catalogoProvinciaService.GetLista();
               return Page();

            }
            catch (Exception ex)
            {
                return Content(ex.Message);
            }

        }

        public async Task<IActionResult> OnPost()
        {
            try
            {
                var result = new DBEntity();
                if (Entity.IdDireccion.HasValue)
                {
                    //Actualizar
                    result = await direccionService.Update(Entity);


                }
                else
                {
                    //Nuevo
                    result = await direccionService.Create(Entity);


                }

                return new JsonResult(result);


            }
            catch (Exception ex)
            {

                return new JsonResult(new DBEntity { CodeError = ex.HResult, MsgError = ex.Message });
            }



        }

        public async Task<IActionResult> OnPostChangeProvincia()
        {
            try
            {
                var result = await catalogoCantonService.GetLista(
                    
                    new CatalogoProvinciaEntity { IdCatalogoProvincia= Entity.IdCatalogoProvincia}
                    
                    );

                return new JsonResult(result);


            }
            catch (Exception ex)
            {

                return new JsonResult(new DBEntity { CodeError = ex.HResult, MsgError = ex.Message });
            }
        }

        public async Task<IActionResult> OnPostChangeCanton()
        {
            try
            {
                var result = await catalogoDistritoService.GetLista(

                    new CatalogoCantonEntity { IdCatalogoCanton = Entity.IdCatalogoCanton }

                    );

                return new JsonResult(result);


            }
            catch (Exception ex)
            {

                return new JsonResult(new DBEntity { CodeError = ex.HResult, MsgError = ex.Message });
            }
        }




    }
}
