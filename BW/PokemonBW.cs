using Abstracciones.BW;
using Abstracciones.DA;
using Abstracciones.Modelos;
using Abstracciones.SG;

namespace BW
{
    public class PokemonBW : IPokemonBW
    {

        private IPokemonDA _pokemonDA;
        private IPokemonSG _pokemonSG;

        public PokemonBW(IPokemonDA pokemonDA, IPokemonSG pokemonSG)
        {
            _pokemonDA = pokemonDA;
            _pokemonSG = pokemonSG;
        }

        public async Task<IEnumerable<Equipo>> ObtenerEquipos()
        {
            var equiposPokemon= await _pokemonDA.ObtenerEquipos();
            
            return equiposPokemon;
        }

        public async Task<IEnumerable<Pokemon>> ObtenerPokemonXEquipos(Guid Id)
        {
            var pokemonBD = await _pokemonDA.ObtenerPokemonXEquipo(Id);
            IEnumerable<Pokemon> EquipoPokemon= new List<Pokemon>();
            foreach (var pokemon in pokemonBD) {
                var pokemonAPI = await _pokemonSG.Obtener(pokemon.Numero);
                //Implementar lógica para completar el modelo Pokemon con la información del API
            }
            
            return EquipoPokemon;
        }
    }
}
