using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using GL.ReiDoAlmoco.Site.Models.Voto;
using Microsoft.Extensions.Configuration;

namespace GL.ReiDoAlmoco.Site.Services
{
    public class VotoServico : IVotoServico
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        public VotoServico(IHttpClientFactory httpClientFactory, IConfiguration configuration)
        {
            _configuration = configuration;
            _httpClient = httpClientFactory.CreateClient();
            _httpClient.BaseAddress = new Uri(_configuration["UrlApi"]);
        }

        public async Task<ListaVencedorDiarioModel> ListarVencedorDiarioAsync()
        {
            using (var response = await _httpClient.GetAsync("voto/listar-por-dia"))
            {
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    var result = await response.Content.ReadAsAsync<ListaVencedorDiarioModel>();
                    return result;
                }
                return null;
            }
        }

        public async Task<ListaVencedorSemanalModel> ListarVencedorSemanalAsync()
        {
            using (var response = await _httpClient.GetAsync("voto/listar-semanal"))
            {
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    var result = await response.Content.ReadAsAsync<ListaVencedorSemanalModel>();
                    return result;
                }
                return null;
            }
        }

        public async Task<IEnumerable<EleicaoDoDiaModel>> ObterEleicaoDoDia()
        {
             using (var response = await _httpClient.GetAsync("voto/eleicao-do-dia"))
            {
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    var result = await response.Content.ReadAsAsync<IEnumerable<EleicaoDoDiaModel>>();
                    return result;
                }
                return null;
            }
        }

        public async Task<PeriodoVotacaoModel> ObterPeriodoVotacao()
        {
            using (var response = await _httpClient.GetAsync("voto/obter-periodo-votacao"))
            {
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    var result = await response.Content.ReadAsAsync<PeriodoVotacaoModel>();
                    return result;
                }
                return null;
            }
        }

        public async Task<RequestResult> VotarAsync(Guid pretendenteId)
        {
            using (var response = await _httpClient.PutAsync($"voto/{pretendenteId}", null))
            {
                if (response.StatusCode == HttpStatusCode.NotFound)
                    return null;
                return await response.Content.ReadAsAsync<RequestResult>();
            }
        }
    }
}
