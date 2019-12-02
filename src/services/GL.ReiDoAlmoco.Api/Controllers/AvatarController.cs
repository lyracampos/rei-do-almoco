using System;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
namespace GL.ReiDoAlmoco.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Produces("application/json")]
    public class AvatarController : ControllerPadrao
    {
        private readonly IAvatarServico _avatarServico;

        public AvatarController(IAvatarServico avatarServico)
        {
            _avatarServico = avatarServico;
        }

        [HttpPut("{id}")]
        [Consumes("multipart/form-data")]
        public async Task<IActionResult> Put(Guid id, [FromForm] IFormFile arquivo)
        {
            if (ModelState.IsValid)
                return RetornarRequestResult(await _avatarServico.AdicionarAsync(id, arquivo));
            return BadRequest();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(Guid id)
        {
            var resultado = _avatarServico.Remover(id);
            if (resultado.Sucesso)
                return Ok(resultado);
            return BadRequest(resultado);
        }

        [HttpGet("{id}")]
        public IActionResult Get(Guid id)
        {
            var avatar = _avatarServico.Obter(id);
            return File(avatar, "image/jpeg");
        }
    }
}
