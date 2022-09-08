using ApiMsqlData.Repositories;
using ApiMsqlModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ApiRestSQL.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PokemonsController : ControllerBase
    {
        private readonly IPokemonRepository _pokemonRepository;
        //constructor p' asignar el valor...
        public PokemonsController(IPokemonRepository pokemonRepository)
        {
            _pokemonRepository = pokemonRepository;
        }
        //ahora los métodos de la API
        [HttpGet]// consulta general 
        //getallpokes
        public async Task<IActionResult> GetAllPokemons()
        {
            return Ok(await _pokemonRepository.GetAllPokemons());
        }

        [HttpGet("{id}")]// localhost/api/pokemon/1 - consulta específica
        //get Specific poke, requerimos de un parametro en la llamada a la api
        public async Task<IActionResult> GetPokemonDetails(int id)
        {
            return Ok(await _pokemonRepository.GetPokemonDetails(id));
        }

        [HttpPost]
        //insert de data
        public async Task<IActionResult> CreatePokemon([FromBody] Pokemon poke)
        {
            //en teoería, segun entendi, vamos a deserializarlo, o sea, leer el JSON de la peticion
            //validaciones
            if (poke == null)
            {
                return BadRequest();//es un action result, regresa que la peticion fue mala
            }
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);//si el modelo de la peticion es invalido? como asi? xd tendra que ver con los models? (capa modelo)
                //segun le entendi es para cuando pedimos un campo y no esta definido
                //entonces no sigue el modelo correcto
                //valida que todos los atributos de todas las propiedades se cumplan
            }

            var created = await _pokemonRepository.InsertPokemon(poke);//insertamos
            //y regresamos a ver si metio o no el dato
            return Created("created", created);//entiendo que la variable podria llamarse diferente, pero no me arriesgare a probarlo hasta que me funcione el api por 1ra vez
        }
        //ahora se viene el update
        [HttpPut]
        //actu de data
        public async Task<IActionResult> UpdatePokemon([FromBody] Pokemon poke)
        {
            if (poke == null)
            {
                return BadRequest();
            }
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _pokemonRepository.UpdatePokemon(poke);

            return NoContent();//como solo actualizo, solo regreso nada?xd
        }

        //delete
        [HttpDelete("{id}")]
        //borrado de data, requiere de parametro id
        public async Task<IActionResult> DeletePokemon(int id)
        {
            await _pokemonRepository.DeletePokemon(new Pokemon { Id = id });
            return NoContent();

        }

        //los nomrbes de los metodos no son importantes porque el request http sera quien
        //tendra toda la informacion, para que el controlador sepa a que metodo tiene
        //que mandarlo segun el tipo de rqeuest y la cantidad de parametros

        //este es el ultimo paso, ahora compilamos y recemos porque funcione
        //para las pruebas dicen que swagger ya viene incorpordado
    }
}
