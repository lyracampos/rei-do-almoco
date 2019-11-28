using System.Threading;
using GL.ReiDoAlmoco.Api.Handlers;
using GL.ReiDoAlmoco.Domain.Interfaces;
using MediatR;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Moq;
namespace GL.ReiDoAlmoco.Api.Tests.UnitTests
{
    public abstract class PretendenteCommandHandlerTests
    {
        protected CancellationToken _cancellationToken;
        protected Mock<IPretendenteRepositorio> _pretendenteRepositorio;
        protected Mock<IMediator> _bus;
        protected Mock<ILogger<PretendenteCommandHandler>> _logger;
        protected Mock<IConfiguration> _configuration;
        protected PretendenteCommandHandler _handler;

        public PretendenteCommandHandlerTests()
        {
            _cancellationToken = CancellationToken.None;
            _pretendenteRepositorio = new Mock<IPretendenteRepositorio>();
            _bus = new Mock<IMediator>();
            _logger = new Mock<ILogger<PretendenteCommandHandler>>();
            _configuration = new Mock<IConfiguration>();

            _handler = new PretendenteCommandHandler(_pretendenteRepositorio.Object, _bus.Object, _logger.Object, _configuration.Object);
        }
    }
}
