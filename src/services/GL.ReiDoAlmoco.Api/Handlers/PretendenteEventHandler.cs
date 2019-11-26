using System.Threading;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Events.Pretendente;
using MediatR;
using Microsoft.Extensions.Logging;
namespace GL.ReiDoAlmoco.Api.Handlers
{
    public class PretendenteEventHandler : 
        INotificationHandler<PretendenteCriadoEvent>,
        INotificationHandler<PretendenteEditadoEvent>,
        INotificationHandler<PretendenteRemovidoEvent>
    {
        private readonly ILogger _logger;
        public PretendenteEventHandler(
            ILogger<PretendenteEventHandler> logger)
        {
            _logger = logger;
        }

        public Task Handle(PretendenteCriadoEvent notification, CancellationToken cancellationToken)
        {
            //enviar e-mail
            _logger.LogInformation($"Novo pretendente: \r\n  nome: {notification.Nome} \r\n  e-mail: {notification.Email}");
            return Task.CompletedTask;
        }
        public Task Handle(PretendenteEditadoEvent notification, CancellationToken cancellationToken)
        {
            _logger.LogInformation($"Pretendente {notification.Id} teve o nome alterado para: {notification.Nome}.");
            return Task.CompletedTask;
        }
        public Task Handle(PretendenteRemovidoEvent notification, CancellationToken cancellationToken)
        {
            _logger.LogInformation($"Pretendente {notification.Id} foi removido.");
            return Task.CompletedTask;
        }
    }
}