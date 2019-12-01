using System;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Commands.Pretendente;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using Microsoft.AspNetCore.Mvc;
using Moq;
using Xunit;

namespace GL.ReiDoAlmoco.Api.Tests.Pretendentes.Controllers
{
    public class ControllerPostTests : ControllerTestsBase
    {
        [Fact(DisplayName = "Adicionar - retorna status ok ao adicionar pretendente.")]
        public async Task deve_retornar_ok_quando_adicionar_pretendente()
        {
            //arrange
            var comando = new CriarPretendenteCommand("Nome do Pretendente", "emaildopretendente@dominio.com.br");
            _bus.Setup(p => p.Send(comando, _cancellationToken)).ReturnsAsync(new RequestResult().Ok());

            //act
            var resultado = await _controller.Post(comando, _cancellationToken);

            //assert
            Assert.IsType<OkObjectResult>(resultado);
            _bus.Verify(p => p.Send(comando, _cancellationToken), Times.Once);
        }

        [Fact(DisplayName = "Adicionar - retorna status badrequest quando a solicitação for invalida.")]
        public async Task deve_retornar_badrequest_quando_comando_invalido()
        {
            //arrange
            var comando = new CriarPretendenteCommand("", "emaildopretendente@dominio.com.br");
            _bus.Setup(p => p.Send(comando, _cancellationToken)).ReturnsAsync(new RequestResult().BadRequest(new string[] { "nome é obrigatório" }));
            _controller.ModelState.AddModelError("Error", "ModelStateError");

            //act
            var resultado = await _controller.Post(comando, _cancellationToken);

            //assert
            Assert.IsType<BadRequestObjectResult>(resultado);
            _bus.Verify(p => p.Send(comando, _cancellationToken), Times.Never);
        }
    }
}
