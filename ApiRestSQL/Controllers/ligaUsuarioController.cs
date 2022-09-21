using ApiMsqlData.Repositories;
using ApiMsqlModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ApiRestSQL.Controllers
{


    [Route("api/[controller]")] // localhost/api/usuario
    [ApiController]

    public class ligaUsuarioController: ControllerBase
    {
        private readonly ILigaUsuarioRepository _ligaUsuarioRepository;
        //private readonly ILigaRepository _ligaRepository;

        public ligaUsuarioController(ILigaUsuarioRepository LigaUsuarioRepository)
        {
            _ligaUsuarioRepository = LigaUsuarioRepository;
        }

        [HttpGet] // consulta etiqueta
        //cuando llegue una petición tipo GET a la api, va entrar al método siguiente:
        public async Task<IActionResult> GetAllLigaUsuarios()
        {
            return Ok(await _ligaUsuarioRepository.GetAllLigaUsuarios());
        }

        [HttpGet("{id}")]
        //será la consulta individual específica, donde se hace una petición GET a una url o endpoint como el siguiente:
        // localhost/api/usuario/1 <- el 1 de acá es el parámetro "{id}"
        public async Task<IActionResult> GetLigaDetails(int id)
        {
            return Ok(await _ligaUsuarioRepository.GetLigaUsuarioDetails(id));
        }

        [HttpPost] //insert de Liga
        public async Task<IActionResult> InsertLigaUsuario([FromBody] ligaUsuario lig)
        {
            if (lig == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var ligaUsuario = await _ligaUsuarioRepository.InsertLigaUsuario(lig); //ponerle created si truena

            return Created("created", ligaUsuario);
        }

        [HttpPut] //actualización de liga
        public async Task<IActionResult> UpdateLigaUsuario([FromBody] ligaUsuario lig)
        {
            if (lig == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _ligaUsuarioRepository.UpdateLigaUsuario(lig);

            return NoContent();//204 - respuesta exitosa, pero sin mayor detalle
        }

        [HttpDelete] //borrado de datos
        public async Task<IActionResult> DeleteLigaUsuario([FromBody] ligaUsuario lig)
        {
            //este solo da de baja
            if (lig == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _ligaUsuarioRepository.DeleteLigaUsuario(lig);

            return NoContent();//204 - respuesta exitosa, pero sin mayor detalle
        }

    }
}
