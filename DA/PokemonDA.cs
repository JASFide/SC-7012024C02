﻿using Abstracciones.Modelos;
using Abstracciones.DA;
using Microsoft.Data.SqlClient;
using Dapper;
using Helpers;
using Abstracciones.Entidades;

namespace DA
{
    public class PokemonDA : IPokemonDA
    {
        private IRepositorioDapper _repositorioDapper;
        private SqlConnection _sqlConnection;

        public PokemonDA(IRepositorioDapper repositorioDapper)
        {
            _repositorioDapper = repositorioDapper;
            _sqlConnection = _repositorioDapper.ObtenerRepositorioDapper();
        }

        public async Task<IEnumerable<Abstracciones.Modelos.Equipo>> ObtenerEquipos()
        {
            string query = @"[ListarEquipos]";
            var consulta= await _sqlConnection.QueryAsync<Abstracciones.Modelos.Equipo>(query);
            return consulta;
            
        }

        public async Task<IEnumerable<Abstracciones.Modelos.Pokemon>> ObtenerPokemonXEquipo(Guid Id)
        {
            string query = @"[ListarPokemonEquipo]";
            var consulta = await _sqlConnection.QueryAsync<Abstracciones.Entidades.Pokemon>(query, new { IdEquipo=Id });
            return ConvertirListaPokemonDBAModelo(consulta);
        }

        #region Convertidores

        private IEnumerable<Abstracciones.Modelos.Pokemon> ConvertirListaPokemonDBAModelo(IEnumerable<Abstracciones.Entidades.Pokemon> pokemon)
        {
            var resultadoConversion = Convertidor.ConvertirLista<Abstracciones.Entidades.Pokemon, Abstracciones.Modelos.Pokemon>(pokemon);
            return resultadoConversion;
        }

        #endregion
    }
}
