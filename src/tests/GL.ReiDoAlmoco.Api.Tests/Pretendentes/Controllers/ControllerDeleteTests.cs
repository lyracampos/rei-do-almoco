using System;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Commands.Pretendente;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using Microsoft.AspNetCore.Mvc;
using Moq;
using Xunit;

namespace GL.ReiDoAlmoco.Api.Tests.Pretendentes.Controllers
{
    public class ControllerDeleteTests : ControllerTestsBase
    {
        [Fact(DisplayName = "Delete - retorna status ok ao remover pretendente.")]
        public async Task deve_retornar_ok_quando_remover_pretendente()
        {
            //arrange
            var id = Guid.NewGuid();
            _bus.Setup(p => p.Send(It.IsAny<RemoverPretendenteCommand>(), _cancellationToken)).ReturnsAsync(new RequestResult().Ok());

            //act
            var resultado = await _controller.Delete(id, _cancellationToken);

            //assert
            Assert.IsType<OkObjectResult>(resultado);
            _bus.Verify(p => p.Send(It.IsAny<RemoverPretendenteCommand>(), _cancellationToken), Times.Once);
        }

        [Fact(DisplayName = "Delete - retorna status notfound quando não encontrar pretendente no banco.")]
        public async Task deve_retornar_badrequest_quando_comando_invalido()
        {
            //arrange
            var id = Guid.NewGuid();
            _bus.Setup(p => p.Send(It.IsAny<RemoverPretendenteCommand>(), _cancellationToken)).ReturnsAsync(new RequestResult().NotFound());

            //act
            var resultado = await _controller.Delete(id, _cancellationToken);

            //assert
            Assert.IsType<NotFoundObjectResult>(resultado);
            _bus.Verify(p => p.Send(It.IsAny<RemoverPretendenteCommand>(), _cancellationToken), Times.Once);
        }
    }
}
