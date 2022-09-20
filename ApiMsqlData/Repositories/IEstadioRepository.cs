using ApiMsqlModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlData.Repositories
{
    public interface IEstadioRepository
    {
        Task<IEnumerable<estadio>> GetAllEstadios();//consulta general
        Task<estadio> GetEstadioDetails(int id);//consulta específica
        Task<bool> InsertEstadio(estadio est);//insertar
        Task<bool> UpdateEstadio(estadio est);//update
        Task<bool> DeleteEstadio(estadio est);//borrar

    }
}
