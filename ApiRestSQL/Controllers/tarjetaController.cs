using ApiMsqlData.Repositories;
using ApiMsqlModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ApiRestSQL.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class tarjetaController : ControllerBase
    {
         private readonly ITarjetaRepository _tarjetaRepository;
         public tarjetaController(ITarjetaRepository tarjetaRepository)
        {
            _tarjetaRepository = tarjetaRepository; 
        }
         [HttpGet] // consulta etiqueta
        //cuando llegue una petición tipo GET a la api, va entrar al método siguiente:
        public async Task<IActionResult> GetAllTarjetas()
        {
            return Ok(await _tarjetaRepository.GetAllTarjetas());
        }

        [HttpGet("{idTarjeta}")]
        //será la consulta individual específica, donde se hace una petición GET a una url o endpoint como el siguiente:
        // localhost/api/usuario/1 <- el 1 de acá es el parámetro "{id}"
        public async Task<IActionResult> GetUsuarioDetails(int idTarjeta)
        {
            return Ok(await _tarjetaRepository.GetTarjetaDetails(idTarjeta));
        }

        [HttpPost] //insert de usuario
        public async Task<IActionResult> InsertUsuario([FromBody] tarjeta tar)
        {
            if (tar == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var tarjeta = await _tarjetaRepository.InsertTarjeta(tar); //ponerle created si truena

            return Created("created",tarjeta);
        }

        [HttpPut] //actualización de tarjeta
        public async Task<IActionResult> UpdateTarjeta([FromBody] tarjeta tar)
        {
            if (tar == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _tarjetaRepository.UpdateTarjeta(tar);

            return NoContent();//204 - respuesta exitosa, pero sin mayor detalle
        }

        [HttpDelete] //borrado de datos
        public async Task<IActionResult> DeleteTarjeta([FromBody] tarjeta tar)
        {
            //este solo da de baja
            if (tar == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _tarjetaRepository.DeleteTarjeta(tar);

            return NoContent();//204 - respuesta exitosa, pero sin mayor detalle
        } 
    }
}
