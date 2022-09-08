using ApiMsqlModel; // se tienen que usar para cargar el modelo de datos
using Dapper; // se tienen que usar para hacer consultas mysql
using MySql.Data.MySqlClient; // se tienen que usar para abrir la conexión
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;

namespace ApiMsqlData.Repositories
{
    public class UsuarioRepository : IUsuarioRepository //se le da : y el nombre de la interfaz, luego se le da que implemente la interfaz y jalará todos los métodos
    {
        //global conexion
        private MySqlConf _conexion;
        public UsuarioRepository(MySqlConf Conexion)
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
        //Métodos de la interfaz
        public async Task<bool> DeleteUsuario(usuario usu)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        UPDATE `usuario` SET `estado` = 0
                        WHERE `idUsuario` = @idUsuario";
            var result = await db.ExecuteAsync(sql, new { usu.idUsuario });

            dbCerrarConexion(db);
            return result > 0;
        }

        public async Task<IEnumerable<usuario>> GetAllUsuarios()
        {
            var db = dbAbrirConexion();
            var sql = @"SELECT * 
                        FROM `usuario`
                        WHERE `estado`=1;";
            //esto cierra la conexión
            //this.dbCerrarConexion(db);
            return await db.QueryAsync<usuario>(sql, new { });
        }

        public async Task<usuario> GetUsuarioDetails(int id)
        {
            var db = dbAbrirConexion();

            var sql = @" 
                        SELECT * 
                        FROM `usuario`
                        WHERE `estado`=1 AND `idUsuario` = @id ;";

            return await db.QueryFirstOrDefaultAsync<usuario>(sql, new { id = id });
        }

        public async Task<bool> InsertUsuario(usuario usu)
        {
            var db = dbAbrirConexion();
            var sql = @"
                        INSERT INTO `usuario` (`nomUsuario`, `pass`, `email`, `estado`) 
                        values (@nomUsuario, @pass, @email, '1');"; // poner igual que en la clase modelo de datos o sea igual que la Bd
            var result = await db.ExecuteAsync(sql, new { usu.nomUsuario, usu.pass, usu.email });

            //cerrar conexión
            dbCerrarConexion(db);
            return result > 0; //verificamos y regresamos la condición de que modifico más de una tabla
        }

        public async Task<bool> UpdateUsuario(usuario usu) //update INDIVIDUAL
        {
            //************************************
            //SE DEBEN DE AGREGAR VALIDACIONES PARA
            //REVISAR LOS CAMPOS QUE MANDA EL USUARIO
            //Y CUALES ACTUALIZAR
            //SI NO ACEPTA LAS PETICIONES SOLO CON ALGUNSO CAMPOS DEFINIDOS
            //(ej: no manda el nomnre), ENTONCES PONER '?' EN EL MODELO DE DATOS
            //PARA ESPECIFICAR QUE EL CAMPO PUEDE SER NULL
            //************************************
            var db = dbAbrirConexion();
            var sql = @"
                        UPDATE `usuario` SET `nomUsuario` = @nomUsuario, `pass` = @pass, `email` = @email
                        WHERE `idUsuario` = @idUsuario";
            var result = await db.ExecuteAsync(sql, new {usu.nomUsuario, usu.pass, usu.email, usu.idUsuario });

            dbCerrarConexion(db);
            return result > 0;
        }
    }
}
