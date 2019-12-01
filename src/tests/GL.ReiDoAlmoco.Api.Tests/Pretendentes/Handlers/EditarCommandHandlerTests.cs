using System;
using System.Linq;
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
    public class EditarCommandHandlerTests :  CommandHandlerBase
    {
        [Fact(DisplayName = "EditarCommand Handler - retorna sucesso quando conseguir editar os dados do pretendente")]
        public async Task deve_retornar_sucesso_quando_editar_pretendente()
        {
            //arrange
            var comando = new EditarPretendenteCommand(Guid.NewGuid(), "Nome do pretendente atualizado");
            var evento = new PretendenteEditadoEvent(comando.Id, comando.Nome);
            var pretendenteDb = new Pretendente("Nome do pretendente", "emaildopretendente@dominio.com");

            _bus.Setup(p => p.Publish(It.IsAny<PretendenteEditadoEvent>(), _cancellationToken))
                .Callback<PretendenteEditadoEvent, CancellationToken>
                ((re, ca) => { evento = re; _cancellationToken = ca; });

            _pretendenteRepositorio.Setup(p => p.ObterAsync(comando.Id)).ReturnsAsync(pretendenteDb);
            _pretendenteRepositorio.Setup(p => p.AtualizarAsync(pretendenteDb)).Returns(Task.CompletedTask);

            //act
            var resultado = await _handler.Handle(comando, _cancellationToken);

            //assert
            Assert.True(resultado.Sucesso);
            Assert.Equal(resultado.StatusCode, HttpStatusCode.OK);
            Assert.Equal(comando.Nome, pretendenteDb.Nome);
            Assert.Equal(resultado.Mensagem, "Operação realizada com sucesso.");
            _pretendenteRepositorio.Verify(p => p.AtualizarAsync(It.IsAny<Pretendente>()), Times.Once);
            _bus.Verify(p => p.Publish(evento, _cancellationToken), Times.Once);
        }

        [Fact(DisplayName = "EditarCommand Handler - retorna erro quando não encontrar pretendente na base")]
        public async Task deve_retornar_erro_quando_nao_encontrar_pretendente()
        {
            //arrange
            var comando = new EditarPretendenteCommand(Guid.NewGuid(), "Nome do pretendente atualizado");
            Pretendente pretendente = null;
            _pretendenteRepositorio.Setup(p => p.ObterAsync(comando.Id)).ReturnsAsync(pretendente);

            //act
            var resultado = await _handler.Handle(comando, _cancellationToken);

            //assert
            Assert.False(resultado.Sucesso);
            Assert.Equal(resultado.StatusCode, HttpStatusCode.NotFound);
            Assert.Equal(resultado.Mensagem, "Objeto não encontrado.");
            _pretendenteRepositorio.Verify(p => p.AtualizarAsync(It.IsAny<Pretendente>()), Times.Never);
            _bus.Verify(p => p.Publish(It.IsAny<PretendenteEditadoEvent>(), _cancellationToken), Times.Never);
        }
    }
}
