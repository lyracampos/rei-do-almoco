using System.Net;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using Microsoft.AspNetCore.Mvc;
namespace GL.ReiDoAlmoco.Api.Controllers
{
    public abstract class ControllerPadrao : ControllerBase
    {
        protected IActionResult RetornarRequestResult(RequestResult resultado)
        {
            switch (resultado.StatusCode)
            {
                case HttpStatusCode.OK:
                    return Ok(resultado);
                case HttpStatusCode.NotFound:
                    return NotFound(resultado);
                case HttpStatusCode.BadRequest:
                    return BadRequest(resultado);
                default:
                    return BadRequest();
            }
        }
    }
}
