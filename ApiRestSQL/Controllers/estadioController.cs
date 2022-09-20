using ApiMsqlData.Repositories;
using ApiMsqlModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ApiRestSQL.Controllers
{
    [Route("api/[controller]")] // localhost/api/usuario
    [ApiController]
    public class estadioController : ControllerBase
    {
        private readonly IEstadioRepository _estadioRepository;
        public estadioController(IEstadioRepository estadioRepository)
        {
            _estadioRepository = estadioRepository;
        }

        [HttpGet] // consulta etiqueta
        //cuando llegue una petición tipo GET a la api, va entrar al método siguiente:
        public async Task<IActionResult> GetAllEstadios()
        {
            return Ok(await _estadioRepository.GetAllEstadios());
        }

        [HttpGet("{id}")]
        //será la consulta individual específica, donde se hace una petición GET a una url o endpoint como el siguiente:
        // localhost/api/usuario/1 <- el 1 de acá es el parámetro "{id}"
        public async Task<IActionResult> GetEstadioDetails(int id)
        {
            return Ok(await _estadioRepository.GetEstadioDetails(id));
        }


        [HttpPost] //insert de usuario
        public async Task<IActionResult> InsertEstadio([FromBody] estadio est)
        {
            if (est == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var estadio = await _estadioRepository.InsertEstadio(est); //ponerle created si truena

            return Created("created", estadio);
        }


        [HttpPut] //actualización de usuario
        public async Task<IActionResult> UpdateEstadio([FromBody] estadio est)
        {
            if (est == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _estadioRepository.UpdateEstadio(est);

            return NoContent();//204 - respuesta exitosa, pero sin mayor detalle
        }

        [HttpDelete] //borrado de datos
        public async Task<IActionResult> DeleteEstadio([FromBody] estadio est)
        {
            //este solo da de baja
            if (est == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _estadioRepository.DeleteEstadio(est);

            return NoContent();//204 - respuesta exitosa, pero sin mayor detalle
        }
    }
}
