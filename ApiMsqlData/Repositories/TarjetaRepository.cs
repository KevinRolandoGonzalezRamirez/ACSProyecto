using ApiMsqlModel; // se tienen que usar para cargar el modelo de datos
using Dapper; // se tienen que usar para hacer consultas mysql
using MySql.Data.MySqlClient; // se tienen que usar para abrir la conexión
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlData.Repositories
{
    public class TarjetaRepository : ITarjetaRepository
    {
        //global conexion
        private MySqlConf _conexion;
        public TarjetaRepository(MySqlConf Conexion)
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

        public async Task<bool> DeleteTarjeta(tarjeta tar)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        UPDATE tarjeta SET estado = 0
                        WHERE idTarjeta = @idTarjeta";
            var result = await db.ExecuteAsync(sql, new { tar.idTarjeta });
            dbCerrarConexion(db);
            return result > 0;
        }

        public async Task<IEnumerable<tarjeta>> GetAllTarjetas()
        {
            var db = dbAbrirConexion();
            var sql = @"SELECT * 
                         FROM tarjeta 
                         WHERE estado = 1";
            return await db.QueryAsync<tarjeta>(sql, new { });
        }

        public async Task<tarjeta> GetTarjetaDetails(int idTarjeta)
        {
            var db = dbAbrirConexion();

            var sql = @" 
                        SELECT * 
                        FROM tarjeta
                        WHERE estado = 1 AND idTarjeta = @idTarjeta ;";
            return await db.QueryFirstOrDefaultAsync<tarjeta>(sql, new { idTarjeta = idTarjeta });
        }

        public async Task<bool> InsertTarjeta(tarjeta tar)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        INSERT INTO tarjeta (nombreEncargado, numerodeTarjeta, cvc, fechaDeCaducidad,tipo, estado) 
                        values (@nombreEncargado, @numerodeTarjeta, @cvc, @fechaDeCaducidad, @tipo, 1);";
            var result = await db.ExecuteAsync(sql, new { tar.nombreEncargado, tar.numerodeTarjeta, tar.cvc, tar.fechaDeCaducidad, tar.tipo });
            return result > 0;
        }

        public async Task<bool> UpdateTarjeta(tarjeta tar)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        UPDATE tarjeta SET nombreEncargado = @nombreEncargado, numerodeTarjeta = @numerodeTarjeta, cvc = @cvc, fechaDeCaducidad = @fechaDeCaducidad, tipo = @tipo
                        WHERE idTarjeta = @idTarjeta";
            var result = await db.ExecuteAsync(sql, new { tar.idTarjeta, tar.nombreEncargado, tar.numerodeTarjeta, tar.cvc, tar.fechaDeCaducidad, tar.tipo });
            dbCerrarConexion(db);
            return result > 0;
        }
    }
}
