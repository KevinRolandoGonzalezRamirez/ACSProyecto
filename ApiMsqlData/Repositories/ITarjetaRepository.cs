using ApiMsqlModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlData.Repositories
{
    public interface ITarjetaRepository
    {
        Task<IEnumerable<tarjeta>> GetAllTarjetas();//consulta general
        Task<tarjeta> GetTarjetaDetails(int idTarjeta);//consulta específica
        Task<bool> InsertTarjeta(tarjeta tar);//insertar
        Task<bool> UpdateTarjeta(tarjeta tar);//update
        Task<bool> DeleteTarjeta(tarjeta tar);//borrar
    }
}
