using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ApiMsqlModel;

namespace ApiMsqlData.Repositories
{
    public interface IEquipoRepository
    {
        Task<IEnumerable<equipo>> GetAllEquipos(); // c. general
        Task<equipo> GetEquipo(int id);// c especif de 1
        Task<bool> InsertEquipo(equipo team); // insertar
        Task<bool> UpdateEquipo(equipo team);//update
        Task<bool> DeleteEquipo(int id);//delete

    }
}
