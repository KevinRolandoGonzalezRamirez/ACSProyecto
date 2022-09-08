using ApiMsqlData.Repositories;
using ApiMsqlModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ApiRestSQL.Controllers
{
    [Route("api/[controller]")] // localhost/api/usuario
    [ApiController]
    public class usuarioController : ControllerBase
    {
        private readonly IUsuarioRepository _usuarioRepository;
        public usuarioController(IUsuarioRepository usuarioRepository)
        {
            _usuarioRepository = usuarioRepository;
        }

        [HttpGet] // consulta etiqueta
        //cuando llegue una petición tipo GET a la api, va entrar al método siguiente:
        public async Task<IActionResult> GetAllUsuario()
        {
            return Ok(await _usuarioRepository.GetAllUsuarios());
        }

        [HttpGet("{id}")]
        //será la consulta individual específica, donde se hace una petición GET a una url o endpoint como el siguiente:
        // localhost/api/usuario/1 <- el 1 de acá es el parámetro "{id}"
        public async Task<IActionResult> GetUsuarioDetails(int id)
        {
            return Ok(await _usuarioRepository.GetUsuarioDetails(id));
        }

        [HttpPost] //insert de usuario
        public async Task<IActionResult> InsertUsuario([FromBody] usuario usu)
        {
            if (usu == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var usuario = await _usuarioRepository.InsertUsuario(usu); //ponerle created si truena

            return Created("created",usuario);
        }

        [HttpPut] //actualización de usuario
        public async Task<IActionResult> UpdateUsuario([FromBody] usuario usu)
        {
            if (usu == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _usuarioRepository.UpdateUsuario(usu);

            return NoContent();//204 - respuesta exitosa, pero sin mayor detalle
        }

        [HttpDelete] //borrado de datos
        public async Task<IActionResult> DeleteUsuario([FromBody] usuario usu)
        {
            //este solo da de baja
            if (usu == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _usuarioRepository.DeleteUsuario(usu);

            return NoContent();//204 - respuesta exitosa, pero sin mayor detalle
        }
    }
}
