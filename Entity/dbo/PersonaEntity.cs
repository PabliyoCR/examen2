using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class PersonaEntity:EN
    {

        public int? IdPersona { get; set; }
        public string Cedula { get; set; }
        public string Nombre { get; set; }
        public string Primer_Apellido { get; set; }
        public string Segundo_Apellido { get; set; }
        public DateTime FechaNacimiento { get; set; } = DateTime.Now;
        public bool TieneHijos { get; set; }
        public string Cuantos { get; set; }


    }
}