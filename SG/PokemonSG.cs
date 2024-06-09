using Abstracciones.Modelos;
using Abstracciones.SG;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using static System.Net.WebRequestMethods;


namespace SG
{
    public class PokemonSG:IPokemonSG
    {

        public IConfiguration _configuration;

        public PokemonSG(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<Pokemon> Obtener(int numero)
        {
            string endPoint = _configuration.GetSection("APIEndPoints").Get<List<APIEndPoint>>().Where(e => e.Nombre == "ObtenerPokemon").First().Valor;
            //string endPoint = "https://pokeapi.co/api/v2/pokemon/{0}";
            var cliente=new HttpClient();
            var solicitud= new HttpRequestMessage(HttpMethod.Get,string.Format(endPoint,numero));
            var respuesta=await cliente.SendAsync(solicitud);
            respuesta.EnsureSuccessStatusCode();
            var resultado=await respuesta.Content.ReadAsStringAsync();
            var pokemonAPI=JsonConvert.DeserializeObject<PokemonAPI>(resultado);
            return new Pokemon() {Numero=pokemonAPI.id,Nombre=pokemonAPI.name,
            Tipo= pokemonAPI.types[0].type.name, crie=pokemonAPI.cries.latest,
            Sprite=pokemonAPI.sprites.other.officialartwork.front_default
            };
        }
    }
}
