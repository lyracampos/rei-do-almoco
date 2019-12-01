using System;
using System.Net;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Entities;
using GL.ReiDoAlmoco.Domain.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace GL.ReiDoAlmoco.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Produces("application/json")]
    public class VotoController : ControllerBase
    {
        private readonly IVotoServico _votoServico;
        public VotoController(IVotoServico votoServico)
        {
            _votoServico = votoServico;
        }

        [HttpGet]
        [Route("listar-por-dia")]
        public async Task<IActionResult> ListarVencedorPorDia()
        {
            return Ok(await _votoServico.ListarVencedorPorDiaAsync());
        }

        [HttpGet]
        [Route("listar-semanal")]
        public async Task<IActionResult> ListarVencedorSemanal()
        {
            var resultado = await _votoServico.ListarVencedorSemanalAsync();
            return Ok(resultado);
        }

        [HttpGet]
        [Route("eleicao-do-dia")]
        public async Task<IActionResult> ObterEleicaoDoDia()
        {
            var resultado = await _votoServico.ObterEleicaoDoDiaAsync();
            return Ok(resultado);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Computar(Guid id)
        {
            var resultado = await _votoServico.ComputarAsync(new Voto(id));
            if (resultado.Sucesso)
                return Ok(resultado);

            if (resultado.StatusCode == HttpStatusCode.NotFound)
                return NotFound(resultado);
            return BadRequest(resultado);
        }

        [HttpGet]
        [Route("obter-periodo-votacao")]
        public IActionResult ObterPeriodoVotacao()
        {
            return Ok(_votoServico.ObterPeriodoVotacao());
        }
    }
}