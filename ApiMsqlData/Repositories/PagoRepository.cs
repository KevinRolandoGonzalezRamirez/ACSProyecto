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
    public class PagoRepository : IPagoRepository
    {
        private MySqlConf _conexion;

        public PagoRepository(MySqlConf Conexion)
        {
            _conexion = Conexion;
        }

        protected MySqlConnection dbAbrirConexion()
        {
            return new MySqlConnection(_conexion.Conexion);
        }
        protected void dbCerrarConexion(MySqlConnection conexion)
        {
            conexion.Close();
        }

        public async Task<IEnumerable<pago>> GetAllPagos()
        {
            var db = dbAbrirConexion();
            var sql = @"SELECT * 
                         FROM pago";
            return await db.QueryAsync<pago>(sql, new { });
        }

        public async Task<pago> GetPagoDetails(int idPago)
        {
              var db = dbAbrirConexion();

            var sql = @" 
                        SELECT * 
                        FROM pago
                        WHERE idPago = @idPago;";
            return await db.QueryFirstOrDefaultAsync<pago>(sql, new { idPago = idPago });
        }

        public async Task<bool> InsertPago(pago pag)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        INSERT INTO pago (idUsuario, idTarjeta, idLiga, fechaDePago) 
                        values (@idUsuario, @idTarjeta, @idLiga, @fechaDePago);";
            var result = await db.ExecuteAsync(sql, new { pag.idUsuario, pag.idTarjeta, pag.idLiga, pag.fechaDePago });
            return result > 0; 
        }

    }
}
