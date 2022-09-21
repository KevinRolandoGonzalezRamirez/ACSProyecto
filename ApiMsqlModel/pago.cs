using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlModel
{
    public class pago
    {
        public int idPago { get; set; }
        public int idUsuario { get; set; }
        public int idTarjeta { get; set; }
        public int idLiga { get; set; }
        public string fechaDePago { get; set; }
    }
}
