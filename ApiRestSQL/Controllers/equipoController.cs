using ApiMsqlData.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ApiMsqlModel;

namespace ApiRestSQL.Controllers
{
    [Route("api/[controller]")] //localhost/api/equipo/{id}
    [ApiController]
    public class equipoController : ControllerBase
    {
        private readonly IEquipoRepository _equipoRepository;

        public equipoController(IEquipoRepository equipoRepository)
        {
            this._equipoRepository = equipoRepository;
        }

        [HttpGet]
        //consulta general
        public async Task<IActionResult> GetAllEquipos()
        {
           return Ok(await _equipoRepository.GetAllEquipos());
        }

        [HttpGet("{id}")]//consulta individual
        public async Task<IActionResult> GetEquipo(int id)
        {
            //validación, si el id es 0 o menor, esta fuera de rango
            if(id <= 0)
            {
                return BadRequest();
            }
            //si el id es válido, retornamos lo solicitado
            return Ok(await _equipoRepository.GetEquipo(id));
        }

        [HttpPost]//insert
        public async Task<IActionResult> InsertEquipo([FromBody] equipo team)
        {
            if (team == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var equipo = await _equipoRepository.InsertEquipo(team);

            return Created("created", equipo);
        }

        [HttpPut]//actualizar
        public async Task<IActionResult> UpdateEquipo([FromBody] equipo team)
        {
            //validaciones
            //nulo
            if (team == null)
            {
                return BadRequest();
            }
            //id no válida
            if(team.idEquipo <= 0)
            {
                return BadRequest();
            }
            //no viene ningún dato de los que se pueden actualizar
            if(String.IsNullOrEmpty(team.nombreEquipo) &&
                String.IsNullOrEmpty(team.pais))
            {
                return BadRequest();
            }

            await _equipoRepository.UpdateEquipo(team);

            return NoContent();
        }

        [HttpDelete("{id}")] //borrado de datos
        public async Task<IActionResult> DeleteEquipo(int id)
        {
            //validamos el id
            if (id <= 0)
            {
                return BadRequest();
            }

            await _equipoRepository.DeleteEquipo(id);
            return NoContent();
        }
    }
}
