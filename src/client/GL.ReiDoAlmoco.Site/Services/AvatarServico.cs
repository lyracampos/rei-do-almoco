using System;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using GL.ReiDoAlmoco.Site.Models.Avatar;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;

namespace GL.ReiDoAlmoco.Site.Services
{
    public class AvatarServico : IAvatarServico
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;

        public AvatarServico(IHttpClientFactory httpClientFactory, IConfiguration configuration)
        {
            _configuration = configuration;
            _httpClient = httpClientFactory.CreateClient();
            _httpClient.BaseAddress = new Uri(_configuration["UrlApi"]);
        }

        public async Task<RequestResult> AlterarAsync(AlterarAvatarModel model)
        {
            var content = CriarContent(model.Arquivo);
            using (var response = await _httpClient.PutAsync($"avatar/{model.IdDoPretendente}", content))
            {
                if (response.StatusCode == HttpStatusCode.NotFound)
                    return null;
                return await response.Content.ReadAsAsync<RequestResult>();
            }
        }

        private MultipartFormDataContent CriarContent(IFormFile arquivo)
        {
            var bytes = new ByteArrayContent(AlterarAvatarModel.ArquivoToByte(arquivo));
            var content = new MultipartFormDataContent();
            content.Headers.ContentType.MediaType = "multipart/form-data";
            content.Add(bytes, "Arquivo", arquivo.FileName);
            return content;

        }

        public async Task<byte[]> ObterAsync(Guid pretendenteId)
        {
            using (var response = await _httpClient.GetAsync($"avatar/{pretendenteId}"))
            {
                response.EnsureSuccessStatusCode();
                return await response.Content.ReadAsByteArrayAsync();
            }
        }
    }
}
