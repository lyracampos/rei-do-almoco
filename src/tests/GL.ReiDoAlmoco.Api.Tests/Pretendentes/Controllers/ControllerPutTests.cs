using System;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Commands.Pretendente;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using Microsoft.AspNetCore.Mvc;
using Moq;
using Xunit;

namespace GL.ReiDoAlmoco.Api.Tests.Pretendentes.Controllers
{
    public class ControllerPutTests : ControllerTestsBase
    {
        [Fact(DisplayName = "Editar - retorna status ok ao editar pretendente.")]
        public async Task deve_retornar_ok_quando_editar_pretendente()
        {
            //arrange
            var id = Guid.NewGuid();
            var comando = new EditarPretendenteCommand(id, "Nome do Pretendente");
            _bus.Setup(p => p.Send(comando, _cancellationToken)).ReturnsAsync(new RequestResult().Ok());

            //act
            var resultado = await _controller.Put(id, comando, _cancellationToken);

            //assert
            Assert.IsType<OkObjectResult>(resultado);
            _bus.Verify(p => p.Send(comando, _cancellationToken), Times.Once);
        }

        [Fact(DisplayName = "Editar - retorna status notfound quando não encontrar pretendente no banco.")]
        public async Task deve_retornar_badrequest_quando_comando_invalido()
        {
            //arrange
            var id = Guid.NewGuid();
            var comando = new EditarPretendenteCommand(id, "Nome do Pretendente");
            _bus.Setup(p => p.Send(comando, _cancellationToken)).ReturnsAsync(new RequestResult().NotFound());

            //act
            var resultado = await _controller.Put(id, comando, _cancellationToken);

            //assert
            Assert.IsType<NotFoundObjectResult>(resultado);
            _bus.Verify(p => p.Send(comando, _cancellationToken), Times.Once);
        }
    }
}
