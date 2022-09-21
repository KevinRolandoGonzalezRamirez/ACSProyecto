using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlModel
{
    public class ligaUsuario
    {
        public int idRegistro { get; set; }
        public int? idLiga { get; set; }
        public int? idUsuario { get; set; }
        public int punteo { get; set; }
        public int estado { get; set; }
    }
}
