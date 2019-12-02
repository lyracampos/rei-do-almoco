using System;
using System.Net;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Entities;
using GL.ReiDoAlmoco.Domain.Interfaces;
using GL.ReiDoAlmoco.Domain.Services;
using GL.ReiDoAlmoco.Tests.Shared;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Moq;
using Xunit;

namespace GL.ReiDoAlmoco.Domain.Tests
{
    public class VotoServiceTests
    {
        private readonly Mock<IVotoRepositorio> _votoRepositorio;
        private readonly Mock<IPretendenteRepositorio> _pretendenteRepositorio;
        private readonly Mock<ILogger<VotoServico>> _logger;
        private readonly Mock<IConfiguration> _configuration;
        private readonly VotoServico _servico;
        private readonly PretendenteRepositorioFake _pretendenteRepositorioFake;
        public VotoServiceTests()
        {
            _pretendenteRepositorioFake = new PretendenteRepositorioFake();
            _votoRepositorio = new Mock<IVotoRepositorio>();
            _pretendenteRepositorio = new Mock<IPretendenteRepositorio>();
            _logger = new Mock<ILogger<VotoServico>>();
            _configuration = new Mock<IConfiguration>();
            _servico = new VotoServico(_votoRepositorio.Object, _pretendenteRepositorio.Object, _logger.Object, _configuration.Object);
        }

        [Fact(DisplayName = "VotoServico ComputarAsync - retorna sucesso quando conseguir adicionar primeiro voto pretendente.")]
        public async Task deve_retornar_sucesso_quando_adicionar_primeiro_voto_pretendente()
        {
            //arrange
            var pretendenteId = Guid.NewGuid();
            var voto = new Voto(pretendenteId);

            var pretendenteDb = _pretendenteRepositorioFake.ObterUmPretendente();
            _pretendenteRepositorio.Setup(p => p.ObterAsync(pretendenteId)).ReturnsAsync(pretendenteDb);

            Voto votoDb = null;
            _votoRepositorio.Setup(p => p.ObterDoDia(pretendenteId)).ReturnsAsync(votoDb);
            _votoRepositorio.Setup(p => p.AdicionarAsync(voto));            

            var resultado = await _servico.ComputarAsync(voto);

            //assert
            Assert.True(resultado.Sucesso);
            Assert.Equal(resultado.StatusCode, HttpStatusCode.OK);
            Assert.Equal(resultado.Mensagem, "Operação realizada com sucesso.");
            _votoRepositorio.Verify(p => p.AdicionarAsync(It.IsAny<Voto>()), Times.Once);
            _votoRepositorio.Verify(p => p.AtualizarAsync(It.IsAny<Voto>()), Times.Never);
        }

        [Fact(DisplayName = "VotoServico ComputarAsync - retorna sucesso quando conseguir somar voto pretendente.")]
        public async Task deve_retornar_sucesso_quando_somar_voto_pretendente()
        {
            //arrange
            var pretendenteId = Guid.NewGuid();
            var voto = new Voto(pretendenteId);

            var pretendenteDb = _pretendenteRepositorioFake.ObterUmPretendente();
            _pretendenteRepositorio.Setup(p => p.ObterAsync(pretendenteId)).ReturnsAsync(pretendenteDb);

            Voto votoDb = new Voto(pretendenteId);
            _votoRepositorio.Setup(p => p.ObterDoDia(pretendenteId)).ReturnsAsync(votoDb);
            _votoRepositorio.Setup(p => p.AdicionarAsync(voto));

            var resultado = await _servico.ComputarAsync(voto);

            //assert
            Assert.True(resultado.Sucesso);
            Assert.Equal(resultado.StatusCode, HttpStatusCode.OK);
            Assert.Equal(resultado.Mensagem, "Operação realizada com sucesso.");
            _votoRepositorio.Verify(p => p.AdicionarAsync(It.IsAny<Voto>()), Times.Never);
            _votoRepositorio.Verify(p => p.AtualizarAsync(It.IsAny<Voto>()), Times.Once);
        }

        [Fact(DisplayName = "VotoServico ComputarAsync - retorna notfound quando não encontrar pretendente.")]
        public async Task deve_retornar_notfount_quando_nao_encontrar_pretendente()
        {
            //arrange
            var pretendenteId = Guid.NewGuid();
            var voto = new Voto(pretendenteId);

            var pretendenteDb = _pretendenteRepositorioFake.ObterUmPretendenteNull();
            _pretendenteRepositorio.Setup(p => p.ObterAsync(pretendenteId)).ReturnsAsync(pretendenteDb);

            var resultado = await _servico.ComputarAsync(voto);

            //assert
            Assert.False(resultado.Sucesso);
            Assert.Equal(resultado.StatusCode, HttpStatusCode.NotFound);
            Assert.Equal(resultado.Mensagem, "Objeto não encontrado.");
            _votoRepositorio.Verify(p => p.AdicionarAsync(It.IsAny<Voto>()), Times.Never);
            _votoRepositorio.Verify(p => p.AtualizarAsync(It.IsAny<Voto>()), Times.Never);
        }
    }
}
