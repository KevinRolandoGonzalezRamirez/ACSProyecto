using ApiMsqlModel;
using Dapper;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlData.Repositories
{
    public class PokemonRepository : IPokemonRepository
    {
        //glocal conexion
        private MySqlConf _conexion;
        public PokemonRepository(MySqlConf Conexion)
        {
            _conexion = Conexion;
        }

        //abrir conexion
        protected MySqlConnection dbAbrirConexion()
        {
            return new MySqlConnection(_conexion.Conexion);
        }

        //ESTO DE ABAJO SE GENERA AUTOMATICAMENTE XD (ctrl + .) o implementar interfaz en sugerencias
        //ya luego los edite para agregar el codigo porque si no tira que no esta implementado XD

        public Task<bool> DeletePokemon()
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<Pokemon>> GetAllPokemons()
        {
            var db = dbAbrirConexion();
            var sql = @"
                        SELECT `id`, `pokemon`, `nick`, `genero`, `imgUrlTest`, `estado`
                        FROM `pokemon` 
                        WHERE `estado` != 0; ";
            return await db.QueryAsync<Pokemon>(sql, new { });
        }

        public async Task<Pokemon> GetPokemonDetails(int id)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        SELECT `id`, `pokemon`, `nick`, `genero`, `imgUrlTest`, `estado`
                        FROM `pokemon` 
                        WHERE `estado` != 0 AND `id` = @Id ; ";
            //@id parametro que envio en el constructor del dapper
            return await db.QueryFirstOrDefaultAsync<Pokemon>(sql, new { Id = id });
            //ojo, solo devolverá uno, es la consulta individual
            //si quiero consultas más elaboradas, usar la general y modificarla
            //pero ¡Ojo!, los joins me la joden toda, porque no puedo usar un 
            //IEnumerable de una clase pokemon, puesto que la consulta no tendría
            //todos los datos del pokemon XD, tendría + o -
        }

        public async Task<bool> InsertPokemon(Pokemon poke)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        INSERT INTO `pokemon` (`pokemon`, `nick`, `genero`, `imgUrlTest`, `estado`)
                        VALUES (@pokemon, @Nick, @Genero, @ImgUrlTest, @Estado);";
            //OJO: es un insert individual, para uno más trabajado, GG o a lo yolo usar un for...
            //o trabajar en listas pero eso estaría xd, sin dapper se puede con arreglos
            //pero con toda esta m... bien rara, ni idea tengo de como se haría XD
            
            var result =  await db.ExecuteAsync(sql, new { poke.pokemon, poke.Nick, poke.Genero, poke.ImgUrlTest, poke.Estado });

            return result > 0;//porque regresamos la cantidad de filas afectadas, y fijo tiene que ser mayor a cero para decir que hizo el insert
        }

        public async Task<bool> UpdatePokemon(Pokemon poke)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        UPDATE `pokemon` SET `pokemon` = @pokemon, `nick` = @Nick,`genero` = @Genero, `imgUrlTest` = @ImgUrlTest, `estado` = @Estado
                        WHERE `id` = @Id";
            //OJO: update individual... con todos los campos
            //habría que hacer algo para solo actualizar estado (ej dar de baja) y solo actualizar los datos permitidos

            var result = await db.ExecuteAsync(sql, new { poke.pokemon, poke.Nick, poke.Genero, poke.ImgUrlTest, poke.Estado, poke.Id });

            return result > 0;//porque regresamos la cantidad de filas afectadas, y fijo tiene que ser mayor a cero 
        }

        public async Task<bool> DeletePokemon(Pokemon poke)
        {
            var db = dbAbrirConexion();

            //Delete individual... debería ser update estado pero weno, es la 1er api de prueba asi que yolo
            var sql = @"
                        DELETE 
                        FROM `pokemon` 
                        WHERE `id` = @Id ; ";
            //@id parametro que envio en el constructor del dapper
            var result = await db.ExecuteAsync(sql, new { Id = poke.Id });
            return result > 0;
        }
    }
}
