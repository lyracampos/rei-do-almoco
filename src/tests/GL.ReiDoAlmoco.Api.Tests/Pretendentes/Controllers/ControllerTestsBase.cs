using System.Threading;
using GL.ReiDoAlmoco.Api.Controllers;
using GL.ReiDoAlmoco.Domain.Interfaces;
using GL.ReiDoAlmoco.Tests.Shared;
using MediatR;
using Moq;
namespace GL.ReiDoAlmoco.Api.Tests.Pretendentes.Controllers
{
    public class ControllerTestsBase
    {
         protected readonly CancellationToken _cancellationToken;
         protected readonly PretendenteRepositorioFake _repositorioFake;
         protected readonly Mock<IPretendenteRepositorio> _repositorio;
         protected readonly Mock<IMediator> _bus;
         protected readonly PretendenteController _controller;

         public ControllerTestsBase()
         {
            _cancellationToken = CancellationToken.None;
            _repositorioFake = new PretendenteRepositorioFake();
             _repositorio = new Mock<IPretendenteRepositorio>();
             _bus = new Mock<IMediator>();
             _controller = new PretendenteController(_bus.Object, _repositorio.Object);
         }
    }
}
