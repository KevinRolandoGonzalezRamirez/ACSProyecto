using ApiMsqlModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlData.Repositories
{
    public interface IPokemonRepository
    {
        Task<IEnumerable<Pokemon>> GetAllPokemons();//consulta general
        Task<Pokemon> GetPokemonDetails(int id);//consulta específica
        Task<bool> InsertPokemon(Pokemon poke);//insertar
        Task<bool> UpdatePokemon(Pokemon poke);//update
        Task<bool> DeletePokemon(Pokemon poke);//borrar


    }
}
