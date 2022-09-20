using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlModel
{
    public class tarjeta
    {
        public int idTarjeta { get; set; }
        public string nombreEncargado { get; set; }
        public string numerodeTarjeta { get; set; }
        public string cvc { get; set; }
        public string fechaDeCaducidad { get; set; }
        public string tipo { get; set; }
        public int estado { get; set; }
    }
}
