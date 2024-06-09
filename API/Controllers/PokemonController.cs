using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Abstracciones.API;
using Abstracciones.BW;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PokemonController : ControllerBase, IPokemonController
    {
        private IPokemonBW _pokemonBW;

        public PokemonController(IPokemonBW pokemonBW)
        {
            _pokemonBW = pokemonBW;
        }

        [HttpGet]
        public async Task<IActionResult> ObtenerEquipos()
        {
            return Ok(await _pokemonBW.ObtenerEquipos());
        }

        [HttpGet("{Id}")]
        public async Task<IActionResult> ObtenerPokemonxEquipo(Guid Id)
        {
            return Ok(await _pokemonBW.ObtenerPokemonXEquipos(Id));
        }
    }
}
