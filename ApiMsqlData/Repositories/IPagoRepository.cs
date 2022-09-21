using ApiMsqlModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlData.Repositories
{
    public interface IPagoRepository
    {
         Task<IEnumerable<pago>> GetAllPagos();//consulta general
        Task<pago> GetPagoDetails(int idPago);//consulta específica
        Task<bool> InsertPago(pago pag);//insertar  

       
    }
}
