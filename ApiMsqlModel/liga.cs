using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlModel
{
    public class liga
    {
        public int idLiga { get; set; } // autoincrementable
        public string nombreLiga { get; set; }
        public DateOnly fechaCreacion { get; set; }
        public DateOnly fechaCierre { get; set; }
        public int tipodeLiga { get; set; }
        public float precioDeParticipacion { get; set; }
        public string sede { get; set; }
        public int estado { get; set; }


    }
}
