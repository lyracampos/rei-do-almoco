using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using GL.ReiDoAlmoco.Site.Models.Pretendente;
using Microsoft.Extensions.Configuration;

namespace GL.ReiDoAlmoco.Site.Services
{
    public class PretendenteServico : IPretendenteServico
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;

        public PretendenteServico(IHttpClientFactory httpClientFactory, IConfiguration configuration)
        {
            _configuration = configuration;
            _httpClient = httpClientFactory.CreateClient();
            _httpClient.BaseAddress = new Uri(_configuration["UrlApi"]);
        }

        public async Task<RequestResult> AdicionarAsync(AdicionarModel model)
        {
            using (var response = await _httpClient.PostAsJsonAsync("pretendente", model))
            {
                if (response.StatusCode == HttpStatusCode.NotFound)
                    return null;
                return await response.Content.ReadAsAsync<RequestResult>();
            }
        }

        public async Task<RequestResult> AtualizarAsync(EditarModel model)
        {
            using (var response = await _httpClient.PutAsJsonAsync($"pretendente/{model.Id}", model))
            {
                return await response.Content.ReadAsAsync<RequestResult>();
            }
        }

        public async Task<PretendenteListaModel> ListarAsync()
        {
            using (var response = await _httpClient.GetAsync("pretendente"))
            {
                if (response.StatusCode == HttpStatusCode.NotFound)
                    return new PretendenteListaModel(null);

                response.EnsureSuccessStatusCode();
                var result = await response.Content.ReadAsAsync<IEnumerable<PretendenteModel>>();
                return new PretendenteListaModel(result);
            }
        }

        public async Task<PretendenteModel> ObterAsync(Guid id)
        {
            using (var response = await _httpClient.GetAsync($"pretendente/{id}"))
            {
                if (response.StatusCode == HttpStatusCode.NotFound)
                    return null;

                response.EnsureSuccessStatusCode();
                return await response.Content.ReadAsAsync<PretendenteModel>();
            }
        }

        public async Task<RequestResult> RemoverAsync(RemoverModel model)
        {
            using (var response = await _httpClient.DeleteAsync($"pretendente/{model.Id}"))
            {
                return await response.Content.ReadAsAsync<RequestResult>();
            }
        }
    }
}