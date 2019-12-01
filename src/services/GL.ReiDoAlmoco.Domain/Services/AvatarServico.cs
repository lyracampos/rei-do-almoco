using System;
using System.Linq;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Entities;
using GL.ReiDoAlmoco.Domain.Interfaces;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace GL.ReiDoAlmoco.Domain.Services
{
    public class AvatarServico : IAvatarServico
    {
        private readonly ILogger _logger;
        private readonly IConfiguration _configuration;
        public AvatarServico(IConfiguration configuration, ILogger<AvatarServico> logger)
        {
            _configuration = configuration;
            _logger = logger;
        }

        public async Task<RequestResult> AdicionarAsync(Guid pretendenteId, IFormFile arquivo)
        {
            var avatarArquivo = new AvatarArquivo(pretendenteId.ToString(), arquivo, _configuration);

            var validacao = new AvatarArquivoValidator().Validate(avatarArquivo);
            if (!validacao.IsValid)
            {
                _logger.LogError("[Adicionar avatar] - " + validacao.Errors.FirstOrDefault().ErrorMessage);
                return new RequestResult().BadRequest(validacao.Errors.Select(p => p.ErrorMessage).ToArray());
            }

            if (!await avatarArquivo.CopiarAvatarAsync())
            {
                _logger.LogError("[Avatar Adicionar] - erro ao copiar avatar.");
                return new RequestResult().BadRequest(new string[] { "Erro ao copiar avatar." });
            }

            return new RequestResult().Ok();
        }

        public byte[] Obter(Guid pretendenteId)
        {
            var avatarArquivo = new AvatarArquivo(pretendenteId.ToString(), _configuration);
            return avatarArquivo.ObterAvatar();
        }

        public RequestResult Remover(Guid pretendenteId)
        {
            var avatarArquivo = new AvatarArquivo(pretendenteId.ToString(), _configuration);

            if (avatarArquivo.RemoverAvatar())
                return new RequestResult().Ok();

            _logger.LogError("[Avatar Remover] - erro ao remover avatar.");
            return new RequestResult().BadRequest(new string[] { "Erro ao remover avatar." });
        }
    }
}
