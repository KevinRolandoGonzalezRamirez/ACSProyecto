using ApiMsqlModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlData.Repositories
{
    public interface ILigaUsuarioRepository
    {
        Task<IEnumerable<ligaUsuario>> GetAllLigaUsuarios();//consulta general
        Task<ligaUsuario> GetLigaUsuarioDetails(int id);//consulta específica
        Task<bool> InsertLigaUsuario(ligaUsuario lig);//insertar
        Task<bool> UpdateLigaUsuario(ligaUsuario lig);//update
        Task<bool> DeleteLigaUsuario(ligaUsuario lig);//borrar
    }
}
