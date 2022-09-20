using ApiMsqlModel; // se tienen que usar para cargar el modelo de datos
using Dapper; // se tienen que usar para hacer consultas mysql
using MySql.Data.MySqlClient; // se tienen que usar para abrir la conexión
using ApiMsqlModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlData.Repositories
{
    public class EstadioRepository : IEstadioRepository
    {
        //global conexion
        private MySqlConf _conexion;
        public EstadioRepository(MySqlConf Conexion)
        {
            _conexion = Conexion;
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
        public async Task<bool> DeleteEstadio(estadio est)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        UPDATE estadio SET `estado` = 0
                        WHERE idEstadio = @idEstadio";
            var result = await db.ExecuteAsync(sql, new { est.idEstadio });

            dbCerrarConexion(db);
            return result > 0;
        }

        public async Task<IEnumerable<estadio>> GetAllEstadios()
        {
            var db = dbAbrirConexion();
            var sql = @"SELECT * 
                        FROM estadio
                        WHERE estado = 1;";
            //esto cierra la conexión
            //this.dbCerrarConexion(db);
            return await db.QueryAsync<estadio>(sql, new { });
        }

        public async Task<estadio> GetEstadioDetails(int id)
        {
            var db = dbAbrirConexion();

            var sql = @" 
                        SELECT * 
                        FROM estadio
                        WHERE estado = 1 AND idEstadio = @idEstadio ;";

            return await db.QueryFirstOrDefaultAsync<estadio>(sql, new { idEstadio = id });
        }

        public async Task<bool> InsertEstadio(estadio est)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        INSERT INTO estadio (nombre, pais, estado) 
                        values (@nombre, @pais, 1);"; // poner igual que en la clase modelo de datos o sea igual que la Bd
            var result = await db.ExecuteAsync(sql, new { est.nombre, est.pais, est.estado });

            //cerrar conexión
            dbCerrarConexion(db);
            return result > 0; //verificamos y regresamos la condición de que modifico más de una tabla
        }

        public async Task<bool> UpdateEstadio(estadio est)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        UPDATE estadio SET nombre = @nombre, pais = @pais, estado = @estado
                        WHERE idEstadio = @idEstadio";
            var result = await db.ExecuteAsync(sql, new { est.nombre, est.pais, est.estado, est.idEstadio });

            dbCerrarConexion(db);
            return result > 0;
        }
    }
}
