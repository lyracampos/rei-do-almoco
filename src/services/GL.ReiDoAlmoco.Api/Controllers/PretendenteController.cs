using System;
using System.Threading;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Commands.Pretendente;
using GL.ReiDoAlmoco.Domain.Interfaces;
using MediatR;
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
            else
                return NotFound("Pretendente não encontrato.");
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] CriarPretendenteCommand model, CancellationToken cancellationToken)
        {
            if (ModelState.IsValid)
            {
                var result = await _bus.Send(model, cancellationToken);
                if (result.Sucesso)
                    return Ok(result.Mensagem);
                return BadRequest(result.Mensagem);
            }
            return BadRequest(model);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put(Guid id,[FromBody] EditarPretendenteCommand model, CancellationToken cancellationToken)
        {
            if (ModelState.IsValid)
            {
                model.Id = id;
                var result = await _bus.Send(model, cancellationToken);
                if (result.Sucesso)
                    return Ok(result.Mensagem);
                return BadRequest(result.Mensagem);
            }
            return BadRequest(model);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(Guid id, CancellationToken cancellationToken)
        {
            var command = new RemoverPretendenteCommand(id);
            var result = await _bus.Send(command, cancellationToken);
            if (result.Sucesso)
                return Ok(result.Mensagem);
            return BadRequest(result.Mensagem);
        }
    }
}