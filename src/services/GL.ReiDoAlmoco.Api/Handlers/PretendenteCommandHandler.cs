using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Commands.Base;
using GL.ReiDoAlmoco.Domain.Commands.Pretendente;
using GL.ReiDoAlmoco.Domain.Entities;
using GL.ReiDoAlmoco.Domain.Events.Pretendente;
using GL.ReiDoAlmoco.Domain.Interfaces;
using MediatR;
using Microsoft.Extensions.Logging;
namespace GL.ReiDoAlmoco.Api.Handlers
{
    public class PretendenteCommandHandler :
        IRequestHandler<CriarPretendenteCommand, CommandResult>,
        IRequestHandler<EditarPretendenteCommand, CommandResult>,
        IRequestHandler<RemoverPretendenteCommand, CommandResult>
    {
        private readonly IPretendenteRepositorio _pretendenteRepositorio;
        private readonly IMediator _bus;
        private readonly ILogger _logger;
        public PretendenteCommandHandler(
            IPretendenteRepositorio pretendenteRepositorio,
            IMediator bus,
            ILogger<PretendenteCommandHandler> logger)
        {
            _pretendenteRepositorio = pretendenteRepositorio;
            _bus = bus;
            _logger = logger;
        }
        public async Task<CommandResult> Handle(CriarPretendenteCommand request, CancellationToken cancellationToken)
        {
            var pretendente = new Domain.Entities.Pretendente(request.Nome, request.Email);
            var validate = new PretendenteValidator(_pretendenteRepositorio).Validate(pretendente);
            if (!validate.IsValid)
            {
                _logger.LogError(validate.Errors.FirstOrDefault().ErrorMessage);
                return new CommandResult(false, validate.Errors.FirstOrDefault().ErrorMessage);
            }

            await _pretendenteRepositorio.AdicionarAsync(pretendente);
            await _bus.Publish(new PretendenteCriadoEvent(request.Nome, request.Email), cancellationToken);
            return new CommandResult(true, "Pretendente criado com sucesso.");
        }

        public async Task<CommandResult> Handle(EditarPretendenteCommand request, CancellationToken cancellationToken)
        {
            var pretendenteDb = await _pretendenteRepositorio.ObterAsync(request.Id);
            if (pretendenteDb == null)
            {
                _logger.LogError($"[Editar pretendente] - pretendente {request.Id} não encontrato.");
                return new CommandResult(false, "Pretendente não encontrado.");
            }

            pretendenteDb.AtualizarNome(request.Nome);

            var validate = new PretendenteValidator(_pretendenteRepositorio).Validate(pretendenteDb);
            if (!validate.IsValid)
            {
                _logger.LogError("[Editar pretendente] - " + validate.Errors.FirstOrDefault().ErrorMessage);
                return new CommandResult(false, validate.Errors.FirstOrDefault().ErrorMessage);
            }

            await _pretendenteRepositorio.AtualizarAsync(pretendenteDb);
            await _bus.Publish(new PretendenteEditadoEvent(request.Id, request.Nome), cancellationToken);
            return new CommandResult(true, "Pretendente atualizado com sucesso.");
        }

        public async Task<CommandResult> Handle(RemoverPretendenteCommand request, CancellationToken cancellationToken)
        {
            var pretendenteDb = await _pretendenteRepositorio.ObterAsync(request.Id);
            if (pretendenteDb == null)
            {
                _logger.LogError($"[Remover pretendente] - pretendente {request.Id} não encontrato.");
                return new CommandResult(false, "Pretendente não encontrado.");
            }

            await _pretendenteRepositorio.RemoverAsync(request.Id);
            await _bus.Publish(new PretendenteRemovidoEvent(request.Id));
            return new CommandResult(true, "Pretendente removido com sucesso.");
        }
    }
}