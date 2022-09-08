using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlModel
{
    public class usuario
    {
        public int idUsuario { get; set; } //automático
        public string nomUsuario { get; set; }
        public string pass { get; set; }
        public string email { get; set; }
        public int estado { get; set; } // estado 1 habilitado, 0 deshabilitado

    }
}
