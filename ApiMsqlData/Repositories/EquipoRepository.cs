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
    public class EquipoRepository : IEquipoRepository
    {
        private MySqlConf _conexion;

        public EquipoRepository(MySqlConf conexion)
        {
            _conexion = conexion;
        }

        //abrir conexion
        protected MySqlConnection dbAbrirConexion()
        {
            return new MySqlConnection(_conexion.Conexion);
        }

        //cerrar conexión
        protected void dbCerrarConexion(MySqlConnection conexion)
        {
            conexion.Close();
        }
        public async Task<bool> DeleteEquipo(int id)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        UPDATE `equipo` SET `estado` = 0
                        WHERE `idEquipo` = @id";
            var result = await db.ExecuteAsync(sql, new { id });

            dbCerrarConexion(db);
            return result > 0;
        }

        public async Task<IEnumerable<equipo>> GetAllEquipos()
        {
            var db = dbAbrirConexion();
            var sql = @"SELECT * 
                        FROM `equipo`
                        WHERE `estado`=1;";
            var resultado = await db.QueryAsync<equipo>(sql, new { });
            //esto cierra la conexión
            this.dbCerrarConexion(db);
            return resultado;
        }

        public async Task<equipo> GetEquipo(int id)
        {
            var db = dbAbrirConexion();
            var sql = @" 
                        SELECT * 
                        FROM `equipo`
                        WHERE `estado`=1 AND `idEquipo` = @id ;";
            //almaceno los resultados en una variable
            var resultado = await db.QueryFirstOrDefaultAsync<equipo>(sql, new { id = id });
            //y eso me permite cerrar la conexion
            this.dbCerrarConexion(db);
            return resultado;
        }

        public async Task<bool> InsertEquipo(equipo team)
        {
            var db = dbAbrirConexion();
            var sql = @"INSERT INTO `equipo`(`nombreEquipo`, `pais`, `estado`) 
                        VALUES (@nombreEquipo,@pais,'1')";
            var result = await db.ExecuteAsync(sql, new { team.nombreEquipo, team.pais });

            return result > 0;
        }

        public async Task<bool> UpdateEquipo(equipo team)
        {
            var db = dbAbrirConexion();
            /*var sql = @"
                        UPDATE `equipo` SET `nombreEquipo`=[value-2],
                        `pais`=[value-3],`estado`=[value-4] WHERE `idEquipo`=@idEquipo";*/
            var sql = @"
                        UPDATE `equipo` SET ";
            //resultado falso hasta que sepamos si se hizo o no el update
            int result = 0;

            bool nombreEquipo = true;
            bool pais = true;

            //validaciones
            if (String.IsNullOrEmpty(team.nombreEquipo))
            {
                nombreEquipo = false;
            }
            
            if (String.IsNullOrEmpty(team.pais))
            {
                pais = false;
            }

            //que hacer segun las validaciones

            if (nombreEquipo && pais) //si mandan los 2 datos, hacemos el update con ambos
            {
                sql += " nombreEquipo = @nombreEquipo, pais = @pais WHERE `idEquipo` = @idEquipo";
                result = await db.ExecuteAsync(sql, new { team.nombreEquipo, team.pais, team.idEquipo });
            }
            
            if(nombreEquipo && !pais) //si mandan solo nombreEquipo...
            {
                sql += " nombreEquipo = @nombreEquipo WHERE `idEquipo` = @idEquipo";
                result = await db.ExecuteAsync(sql, new { team.nombreEquipo, team.idEquipo });
            }

            if(!nombreEquipo && pais)//si mandan solo pais
            {
                sql += " pais = @pais WHERE `idEquipo` = @idEquipo";
                result = await db.ExecuteAsync(sql, new { team.pais, team.idEquipo });
            }
            //si no mandan nada, result queda en 0 por lo tanto se retorna 0 que se toma como error en el update
            //var result = await db.ExecuteAsync(sql, new {  });

            dbCerrarConexion(db);
            return result > 0;
        }
    }
}
