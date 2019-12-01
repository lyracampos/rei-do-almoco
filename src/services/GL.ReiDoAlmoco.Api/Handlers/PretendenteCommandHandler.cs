using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Commands.Pretendente;
using GL.ReiDoAlmoco.Domain.Entities;
using GL.ReiDoAlmoco.Domain.Events.Pretendente;
using GL.ReiDoAlmoco.Domain.Interfaces;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using MediatR;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
namespace GL.ReiDoAlmoco.Api.Handlers
{
    public class PretendenteCommandHandler :
        IRequestHandler<CriarPretendenteCommand, RequestResult>,
        IRequestHandler<EditarPretendenteCommand, RequestResult>,
        IRequestHandler<RemoverPretendenteCommand, RequestResult>
    {
        private readonly IPretendenteRepositorio _pretendenteRepositorio;
        private readonly IMediator _bus;
        private readonly ILogger _logger;
        private readonly IConfiguration _configuration;
        public PretendenteCommandHandler(
            IPretendenteRepositorio pretendenteRepositorio,
            IMediator bus,
            ILogger<PretendenteCommandHandler> logger,
            IConfiguration configuration)
        {
            _pretendenteRepositorio = pretendenteRepositorio;
            _bus = bus;
            _logger = logger;
            _configuration = configuration;
        }
        public async Task<RequestResult> Handle(CriarPretendenteCommand request, CancellationToken cancellationToken)
        {
            var pretendente = new Domain.Entities.Pretendente(request.Nome, request.Email);
            var validate = new PretendenteValidator(_pretendenteRepositorio).Validate(pretendente);
            if (!validate.IsValid)
            {
                _logger.LogError("[Adicionar pretendente] - " + validate.Errors.FirstOrDefault().ErrorMessage);
                return new RequestResult().BadRequest(validate.Errors.Select(p => p.ErrorMessage).ToArray());
            }

            await _pretendenteRepositorio.AdicionarAsync(pretendente);
            await _bus.Publish(new PretendenteCriadoEvent(request.Nome, request.Email), cancellationToken);
            return new RequestResult().Ok();
        }

        public async Task<RequestResult> Handle(EditarPretendenteCommand request, CancellationToken cancellationToken)
        {
            var pretendenteDb = await _pretendenteRepositorio.ObterAsync(request.Id);
            if (pretendenteDb == null)
            {
                _logger.LogError($"[Editar pretendente] - pretendente {request.Id} não encontrato.");
                return new RequestResult().NotFound();
            }

            pretendenteDb.AtualizarNome(request.Nome);

            var validate = new PretendenteValidator(_pretendenteRepositorio).Validate(pretendenteDb);
            if (!validate.IsValid)
            {
                _logger.LogError("[Editar pretendente] - " + validate.Errors.FirstOrDefault().ErrorMessage);
                return new RequestResult().BadRequest(validate.Errors.Select(p => p.ErrorMessage).ToArray());
            }

            await _pretendenteRepositorio.AtualizarAsync(pretendenteDb);
            await _bus.Publish(new PretendenteEditadoEvent(request.Id, request.Nome), cancellationToken);
            return new RequestResult().Ok();
        }

        public async Task<RequestResult> Handle(RemoverPretendenteCommand request, CancellationToken cancellationToken)
        {
            var pretendenteDb = await _pretendenteRepositorio.ObterAsync(request.Id);
            if (pretendenteDb == null)
            {
                _logger.LogError($"[Remover pretendente] - pretendente {request.Id} não encontrato.");
                return new RequestResult().NotFound();
            }

            await _pretendenteRepositorio.RemoverAsync(request.Id);
            await _bus.Publish(new PretendenteRemovidoEvent(request.Id));

            var avatar = new AvatarArquivo(request.Id.ToString(), _configuration);
            avatar.RemoverAvatar();

            return new RequestResult().Ok();
        }
    }
}