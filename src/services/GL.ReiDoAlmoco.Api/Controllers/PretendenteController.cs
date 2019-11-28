using System;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Commands.Pretendente;
using GL.ReiDoAlmoco.Domain.Interfaces;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
namespace GL.ReiDoAlmoco.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Produces("application/json")]
    public class PretendenteController : ControllerBase
    {
        private readonly IPretendenteRepositorio _pretendenteRepositorio;
        private readonly IMediator _bus;
        public PretendenteController(IMediator bus, IPretendenteRepositorio pretendenteRepositorio)
        {
            _bus = bus;
            _pretendenteRepositorio = pretendenteRepositorio;
        }

        [HttpGet()]
        public async Task<IActionResult> Get()
        {
            return Ok(await _pretendenteRepositorio.ListarAsync());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(Guid id)
        {
            var pretendente = await _pretendenteRepositorio.ObterAsync(id);
            if (pretendente != null)
                return Ok(pretendente);
            return NotFound("Pretendente não encontrato.");
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] CriarPretendenteCommand model, CancellationToken cancellationToken)
        {
            if (ModelState.IsValid)
            {
                var resultado = await _bus.Send(model, cancellationToken);
                if (resultado.Sucesso)
                    return Ok(resultado);

                return BadRequest(resultado);
            }
            return BadRequest(model);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put(Guid id,[FromBody] EditarPretendenteCommand model, CancellationToken cancellationToken)
        {
            if (ModelState.IsValid)
            {
                model.Id = id;
                var resultado = await _bus.Send(model, cancellationToken);
                if (resultado.Sucesso)
                    return Ok(resultado);
                else
                {
                    if (resultado.StatusCode == HttpStatusCode.NotFound)
                        return NotFound(resultado);
                    else
                        return BadRequest(resultado);
                }
            }
            return BadRequest(model);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(Guid id, CancellationToken cancellationToken)
        {
            var command = new RemoverPretendenteCommand(id);
            var resultado = await _bus.Send(command, cancellationToken);
            if (resultado.Sucesso)
                return Ok(resultado);
            else
            {
                if (resultado.StatusCode == HttpStatusCode.NotFound)
                    return NotFound(resultado);
                else
                    return BadRequest(resultado);
            }
        }
    }
}