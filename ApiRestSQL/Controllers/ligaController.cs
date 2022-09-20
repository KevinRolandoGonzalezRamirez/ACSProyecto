using ApiMsqlData.Repositories;
using ApiMsqlModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;


namespace ApiRestSQL.Controllers
{

    [Route("api/[controller]")] // localhost/api/usuario
    [ApiController]
    
    //private readonly IUsuarioRepository _usuarioRepository;

    public class ligaController : ControllerBase
    {
        private readonly ILigaRepository _ligaRepository;

        public ligaController(ILigaRepository LigaRepository)
        {
            _ligaRepository = LigaRepository;
        }

        [HttpGet] // consulta etiqueta
        //cuando llegue una petición tipo GET a la api, va entrar al método siguiente:
        public async Task<IActionResult> GetAllLigas()
        {
            return Ok(await _ligaRepository.GetAllLigas());
        }

        [HttpGet("{id}")]
        //será la consulta individual específica, donde se hace una petición GET a una url o endpoint como el siguiente:
        // localhost/api/usuario/1 <- el 1 de acá es el parámetro "{id}"
        public async Task<IActionResult> GetLigaDetails(int id)
        {
            return Ok(await _ligaRepository.GetLigaDetails(id));
        }

        [HttpPost] //insert de Liga
        public async Task<IActionResult> InsertLiga([FromBody] liga lig)
        {
            if (lig == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var ligas = await _ligaRepository.InsertLiga(lig); //ponerle created si truena

            return Created("created", ligas);
        }

        [HttpPut] //actualización de liga
        public async Task<IActionResult> UpdateLiga([FromBody] liga lig)
        {
            if (lig == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _ligaRepository.UpdateLiga(lig);

            return NoContent();//204 - respuesta exitosa, pero sin mayor detalle
        }

        [HttpDelete] //borrado de datos
        public async Task<IActionResult> DeleteLiga([FromBody] liga lig)
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

            await _ligaRepository.DeleteLiga(lig);

            return NoContent();//204 - respuesta exitosa, pero sin mayor detalle
        }

    }
}
