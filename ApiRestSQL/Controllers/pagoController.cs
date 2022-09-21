using Microsoft.AspNetCore.Mvc;
using ApiMsqlData.Repositories;
using ApiMsqlModel;
using Microsoft.AspNetCore.Http;

namespace ApiRestSQL.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class pagoController : ControllerBase
    {
        private readonly IPagoRepository _pagoRepository;

        public pagoController(IPagoRepository pagoRepository)
        {
            _pagoRepository = pagoRepository; 
        } 

        [HttpGet]

        public async Task<IActionResult> GetAllPagos()
        {
            return Ok(await _pagoRepository.GetAllPagos());
        }

        [HttpGet("{idPago}")]
        //será la consulta individual específica, donde se hace una petición GET a una url o endpoint como el siguiente:
        // localhost/api/usuario/1 <- el 1 de acá es el parámetro "{id}"
        public async Task<IActionResult> GetPagoDetails(int idPago)
        {
            return Ok(await _pagoRepository.GetPagoDetails(idPago));
        }

        [HttpPost] //insert de usuario
        public async Task<IActionResult> InsertPago([FromBody] pago pag)
        {
            if (pag == null)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var pago = await _pagoRepository.InsertPago(pag); //ponerle created si truena

            return Created("created", pago);
        }
    }
}
