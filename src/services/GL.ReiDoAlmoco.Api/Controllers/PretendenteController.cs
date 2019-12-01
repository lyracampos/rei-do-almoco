using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Commands.Pretendente;
using GL.ReiDoAlmoco.Domain.Interfaces;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using MediatR;
using Microsoft.AspNetCore.Mvc;
namespace GL.ReiDoAlmoco.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Produces("application/json")]
    public class PretendenteController : ControllerPadrao
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
            var pretendentes = await _pretendenteRepositorio.ListarAsync();
            if(pretendentes != null && pretendentes.Any())
                return Ok(await _pretendenteRepositorio.ListarAsync());
            return NotFound(null);
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
                return RetornarRequestResult(await _bus.Send(model, cancellationToken));
            return BadRequest(model);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put(Guid id,[FromBody] EditarPretendenteCommand model, CancellationToken cancellationToken)
        {
            if (ModelState.IsValid)
            {
                model.Id = id;
                return RetornarRequestResult(await _bus.Send(model, cancellationToken));
            }
            return BadRequest(model);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(Guid id, CancellationToken cancellationToken)
        {
            var command = new RemoverPretendenteCommand(id);
            return RetornarRequestResult(await _bus.Send(command, cancellationToken));
        }
    }
}