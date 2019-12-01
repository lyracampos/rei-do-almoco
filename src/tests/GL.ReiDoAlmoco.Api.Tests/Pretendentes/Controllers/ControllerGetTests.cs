using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Moq;
using Xunit;
namespace GL.ReiDoAlmoco.Api.Tests.Pretendentes.Controllers
{
    public class ControllerGetTests : ControllerTestsBase
    {
        [Fact(DisplayName = "Listar - retorna uma lista de pretendentes cadastrados.")]
        public async Task deve_retornar_lista_de_pretendentes_cadastrados()
        {
            //arrange
            _repositorio.Setup(p => p.ListarAsync()).ReturnsAsync(_repositorioFake.ListarPretendentes());

            //act
            var resultado = await _controller.Get();

            //assert
            Assert.IsType<OkObjectResult>(resultado);
        }

        [Fact(DisplayName = "Listar - retorna notfound quando não houver pretendentes cadastrados.")]
        public async Task deve_retornar_notfound_quando_nao_houve_pretendentes_cadastrados()
        {
            //arrange
            _repositorio.Setup(p => p.ListarAsync()).ReturnsAsync(_repositorioFake.ListarPretendentesNull());

            //act
            var resultado = await _controller.Get();
            var a = resultado.GetType();

            //assert
            Assert.IsType<NotFoundObjectResult>(resultado);
        }

        [Fact(DisplayName = "Obter - retorna um pretendente cadastrado.")]
        public async Task deve_retornar_um_pretendentes_cadastrados()
        {
            //arrange
            var id = Guid.NewGuid();
            _repositorio.Setup(p => p.ObterAsync(id)).ReturnsAsync(_repositorioFake.ObterUmPretendente());

            //act
            var resultado = await _controller.Get(id);

            //assert
            Assert.IsType<OkObjectResult>(resultado);
        }

        [Fact(DisplayName = "Obter - retorna notfound quando não encontrar o pretendente.")]
        public async Task deve_retornar_notfound_quando_nao_encontrar_pretendente()
        {
            //arrange
            var id = Guid.NewGuid();
            _repositorio.Setup(p => p.ObterAsync(id)).ReturnsAsync(_repositorioFake.ObterUmPretendenteNull());

            //act
            var resultado = await _controller.Get(id);
            var a = resultado.GetType();

            //assert
            Assert.IsType<NotFoundObjectResult>(resultado);
        }
    }
}
