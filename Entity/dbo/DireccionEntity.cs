using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class DireccionEntity:EN
    {
        public DireccionEntity()
        {
            Provincia = Provincia ?? new CatalogoProvinciaEntity();
            Canton = Canton ?? new CatalogoCantonEntity();
            Distrito = Distrito ?? new CatalogoDistritoEntity();
            Persona = Persona ?? new PersonaEntity();
        }
        public int? IdDireccion { get; set; }
        public string DireccionExacta { get; set; }

        public int? IdPersona { get; set; }
        public virtual PersonaEntity Persona { get; set; }

        public int? IdCatalogoProvincia { get; set; }
        public virtual CatalogoProvinciaEntity Provincia { get; set; }

        public int? IdCatalogoCanton { get; set; }
        public CatalogoCantonEntity Canton { get; set; }

        public int? IdCatalogoDistrito { get; set; }
        public CatalogoDistritoEntity Distrito { get; set; }
    }
}
