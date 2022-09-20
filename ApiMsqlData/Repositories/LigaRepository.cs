using ApiMsqlModel; // se tienen que usar para cargar el modelo de datos
using Dapper; // se tienen que usar para hacer consultas mysql
using MySql.Data.MySqlClient; // se tienen que usar para abrir la conexión
using System.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection.Metadata.Ecma335;

namespace ApiMsqlData.Repositories
{
    public class LigaRepository : ILigaRepository

    {
        //global conexion
        private MySqlConf _conexion;

        public LigaRepository(MySqlConf Conexion)
        {
            _conexion = Conexion;
        }

        public async Task<bool> DeleteLiga(liga lig)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        UPDATE liga SET estado = 0
                        WHERE idLiga = @idLiga";
            var result = await db.ExecuteAsync(sql, new { lig.idLiga});

            //dbCerrarConexion(db);
            return result > 0;
        }

        // Método para consultar todas las ligas disponibles
        public async Task<IEnumerable<liga>> GetAllLigas()
        {
            var db = dbAbrirConexion();
            var sql = @"SELECT * 
                        FROM liga
                        WHERE estado=1;";

            return await db.QueryAsync<liga>(sql, new { });
        }

        //Consulta individual de Liga
        public async Task<liga> GetLigaDetails(int id)
        {
            var db = dbAbrirConexion();

            var sql = @" 
                        SELECT * 
                        FROM liga
                        WHERE estado=1 AND idLiga = @id ;";

            return await db.QueryFirstOrDefaultAsync<liga>(sql, new { id = id });
        }

        public async Task<bool> InsertLiga(liga lig)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        INSERT INTO liga (nombreLiga, fechaCreacion, fechaCierre, tipodeLiga, precioDeParticipacion, sede, estado) 
                        values (@nombreLiga, @fechaCreacion, @fechaCierre, @tipodeLiga, @precioDeParticipacion, @sede, '1');"; // poner igual que en la clase modelo de datos o sea igual que la Bd
           
                var result = await db.ExecuteAsync(sql, new { lig.nombreLiga, lig.fechaCreacion, lig.fechaCierre, lig.tipodeLiga, lig.precioDeParticipacion, lig.sede });
                return result > 0; //verificamos y regresamos la condición de que modifico más de una tabla
            

        }

        public async Task<bool> UpdateLiga(liga lig)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        UPDATE liga SET nombreLiga = @nombreLiga, fechaCreacion = @fechaCreacion, fechaCierre = @fechaCierre, tipodeLiga = @tipodeLiga , precioDeParticipacion = @precioDeParticipacion, sede = @sede, estado = @estado
                        WHERE idLiga = @idLiga";
            var result = await db.ExecuteAsync(sql, new {lig.idLiga, lig.nombreLiga, lig.fechaCreacion, lig.fechaCierre, lig.tipodeLiga, lig.precioDeParticipacion, lig.sede, lig.estado });
           
            return result > 0;
        }

        //abrir conexion
        protected MySqlConnection dbAbrirConexion()
        {
            return new MySqlConnection(_conexion.Conexion);
        }


       
    }
}
