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
    public class CriarCommandHandlerTests :  CommandHandlerBase
    {
        [Fact(DisplayName = "CriarCommand Handler - retorna sucesso quando conseguir criar o pretendente")]
        public async Task deve_retornar_sucesso_quando_criar_pretendente()
        {
            //arrange
            var comando = new CriarPretendenteCommand("Nome do pretendente", "emaildopretendente@dominio.com.br");
            var evento = new PretendenteCriadoEvent(comando.Nome, comando.Email);
            var pretendente = new Pretendente(comando.Nome, comando.Email);

            _bus.Setup(p => p.Publish(It.IsAny<PretendenteCriadoEvent>(), _cancellationToken))
                .Callback<PretendenteCriadoEvent, CancellationToken>((re, ca) => { evento = re; _cancellationToken = ca; });

            _pretendenteRepositorio.Setup(p => p.AdicionarAsync(pretendente)).Returns(Task.CompletedTask);

            //act
            var resultado = await _handler.Handle(comando, _cancellationToken);

            //assert
            Assert.True(resultado.Sucesso);
            Assert.Equal(resultado.StatusCode, HttpStatusCode.OK);
            Assert.Equal(resultado.Mensagem, "Operação realizada com sucesso.");
            _pretendenteRepositorio.Verify(p => p.AdicionarAsync(It.IsAny<Pretendente>()), Times.Once);
            _bus.Verify(p => p.Publish(evento, _cancellationToken), Times.Once);
        }

        [Fact(DisplayName = "CriarCommand Handler - retorna erro quando e-mail já existente")]
        public async Task deve_retornar_erro_quando_email_ja_existe()
        {
            //arrange
            var comando = new CriarPretendenteCommand("Nome do pretendente", "emaildopretendente@dominio.com.br");
            var evento = new PretendenteCriadoEvent(comando.Nome, comando.Email);
            var pretendeteDb = new Pretendente(comando.Nome, comando.Email);

            _pretendenteRepositorio.Setup(p => p.ObterPorEmailAsync(comando.Email)).ReturnsAsync(pretendeteDb);

            //act
            var resultado = await _handler.Handle(comando, _cancellationToken);

            //assert
            Assert.False(resultado.Sucesso);
            Assert.Equal(resultado.StatusCode, HttpStatusCode.BadRequest);
            Assert.Equal(resultado.Errors.FirstOrDefault(), "E-mail informado já esta em uso.");
            _pretendenteRepositorio.Verify(p => p.AdicionarAsync(It.IsAny<Pretendente>()), Times.Never);
            _bus.Verify(p => p.Publish(evento, _cancellationToken), Times.Never);
        }
    }
}
