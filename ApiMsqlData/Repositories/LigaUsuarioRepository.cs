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
    public class LigaUsuarioRepository: ILigaUsuarioRepository
    {
        //global conexion
        private MySqlConf _conexion;
        public LigaUsuarioRepository(MySqlConf Conexion)
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

       
        public async Task<bool> InsertLigaUsuario(ligaUsuario lig)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        INSERT INTO ligaUsuario (idLiga, idUsuario, punteo, estado) 
                        values (@idLiga, @idUsuario, @punteo, 1);"; // poner igual que en la clase modelo de datos o sea igual que la Bd
            var result = await db.ExecuteAsync(sql, new {lig.idRegistro,lig.idLiga,lig.idUsuario, lig.punteo, lig.estado });

            //cerrar conexión
            dbCerrarConexion(db);
            return result > 0; //verificamos y regresamos la condición de que modifico más de una tabla
        }

        public async Task<bool> UpdateLigaUsuario(ligaUsuario lig)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        UPDATE ligaUsuario SET idLiga = @idLiga, idUsuario = @idUsuario, punteo = @punteo, estado = @estado
                        WHERE idRegistro = @idRegistro";
            var result = await db.ExecuteAsync(sql, new { lig.idLiga,lig.idUsuario, lig.punteo, lig.estado, lig.idRegistro});

            dbCerrarConexion(db);
            return result > 0;
        }

        public async Task<bool> DeleteLigaUsuario(ligaUsuario lig)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        UPDATE ligaUsuario SET estado = 0
                        WHERE idRegistro = @idRegistro";
            var result = await db.ExecuteAsync(sql, new { lig.idRegistro });

            dbCerrarConexion(db);
            return result > 0;
        }

        public async Task<ligaUsuario> GetLigaUsuarioDetails(int id)
        {
            var db = dbAbrirConexion();

            var sql = @" 
                        SELECT * 
                        FROM ligaUsuario
                        WHERE  idRegistro = @idRegistro;";

            return await db.QueryFirstOrDefaultAsync<ligaUsuario>(sql, new { idRegistro = id });
        }

        public async Task<IEnumerable<ligaUsuario>> GetAllLigaUsuarios()
        {
            var db = dbAbrirConexion();
            var sql = @"SELECT * 
                        FROM ligaUsuario
                        WHERE estado = 1;";
            //esto cierra la conexión
            //this.dbCerrarConexion(db);
            return await db.QueryAsync<ligaUsuario>(sql, new { });
        }
    }
}
