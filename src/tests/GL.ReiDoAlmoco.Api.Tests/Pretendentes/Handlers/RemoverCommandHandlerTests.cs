using System;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Commands.Pretendente;
using GL.ReiDoAlmoco.Domain.Entities;
using GL.ReiDoAlmoco.Domain.Events.Pretendente;
using Moq;
using Xunit;

namespace GL.ReiDoAlmoco.Api.Tests.Pretendentes.Handlers
{
    public class RemoverCommandHandlerTests :  CommandHandlerBase
    {
        [Fact(DisplayName = "RemoverCommand Handler - retorna sucesso quando conseguir remover o pretendente")]
        public async Task deve_retornar_sucesso_quando_editar_pretendente()
        {
            //arrange
            var comando = new RemoverPretendenteCommand(Guid.NewGuid());
            var evento = new PretendenteRemovidoEvent(comando.Id);
            var pretendenteDb = new Pretendente("Nome do pretendente", "emaildopretendente@dominio.com");

            _bus.Setup(p => p.Publish(It.IsAny<PretendenteRemovidoEvent>(), _cancellationToken))
                .Callback<PretendenteRemovidoEvent, CancellationToken>
                ((re, ca) => { evento = re; _cancellationToken = ca; });

            _pretendenteRepositorio.Setup(p => p.ObterAsync(comando.Id)).ReturnsAsync(pretendenteDb);
            _pretendenteRepositorio.Setup(p => p.RemoverAsync(comando.Id)).Returns(Task.CompletedTask);

            //act
            var resultado = await _handler.Handle(comando, _cancellationToken);

            //assert
            Assert.True(resultado.Sucesso);
            Assert.Equal(resultado.StatusCode, HttpStatusCode.OK);
            Assert.Equal(resultado.Mensagem, "Operação realizada com sucesso.");
            _pretendenteRepositorio.Verify(p => p.RemoverAsync(It.IsAny<Guid>()), Times.Once);
            _bus.Verify(p => p.Publish(evento, _cancellationToken), Times.Once);
        }

        [Fact(DisplayName = "RemoverCommand Handler - retorna erro quando não encontrar pretendente na base")]
        public async Task deve_retornar_erro_quando_nao_encontrar_pretendente()
        {
            //arrange
            var comando = new RemoverPretendenteCommand(Guid.NewGuid());
            Pretendente pretendente = null;
            _pretendenteRepositorio.Setup(p => p.ObterAsync(comando.Id)).ReturnsAsync(pretendente);

            //act
            var resultado = await _handler.Handle(comando, _cancellationToken);

            //assert
            Assert.False(resultado.Sucesso);
            Assert.Equal(resultado.StatusCode, HttpStatusCode.NotFound);
            Assert.Equal(resultado.Mensagem, "Objeto não encontrado.");
            _pretendenteRepositorio.Verify(p => p.RemoverAsync(It.IsAny<Guid>()), Times.Never);
            _bus.Verify(p => p.Publish(It.IsAny<PretendenteRemovidoEvent>(), _cancellationToken), Times.Never);
        }
    }
}
