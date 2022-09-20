using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlModel
{
    public class estadio
    {
        public int idEstadio { get; set; }// autoincrement
        public string nombre { get; set; }
        public string pais { get; set; }
        public int estado { get; set; }
    }
}
