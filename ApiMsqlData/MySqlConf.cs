using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlData
{
    public class MySqlConf
    {
        public MySqlConf(string Conexion)
        {
               //ctor - constructor , prop - propiedad
               this.Conexion = Conexion;
        }
        public string Conexion { get; set; }
    }
}
