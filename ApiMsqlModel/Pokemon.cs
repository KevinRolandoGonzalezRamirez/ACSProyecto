using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlModel
{
    public class Pokemon
    {
        public int Id { get; set; } //autoincrement asi que en realidad no importa en insert, pero nos servirá en consulta
        public string pokemon { get; set; }
        public string Nick { get; set; }
        public int Genero { get; set; } //1 macho, 2 hembra
        public string ImgUrlTest { get; set; }//puede ser empty, pero no nulo por si los bugs

        public int Estado { get; set; }//1 activo, 0 inactivo 


    }
}
