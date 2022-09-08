using ApiMsqlModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlData.Repositories
{
    public interface IUsuarioRepository
    {
        Task<IEnumerable<usuario>> GetAllUsuarios();//consulta general
        Task<usuario> GetUsuarioDetails(int id);//consulta específica
        Task<bool> InsertUsuario(usuario usu);//insertar
        Task<bool> UpdateUsuario(usuario usu);//update
        Task<bool> DeleteUsuario(usuario usu);//borrar
    }
}
