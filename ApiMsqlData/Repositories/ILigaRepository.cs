using ApiMsqlModel;
using ApiMsqlModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlData.Repositories
{
    public interface ILigaRepository
    {
        Task<IEnumerable<liga>> GetAllLigas();//consulta general de ligas
        Task<liga> GetLigaDetails(int id);//consulta específica
        Task<bool> InsertLiga(liga lig);//insertar
        Task<bool> UpdateLiga(liga lig);//update
        Task<bool> DeleteLiga(liga lig);//borrar
    }
}
