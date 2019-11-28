using System;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Site.Models.Avatar;
using GL.ReiDoAlmoco.Site.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
namespace GL.ReiDoAlmoco.Site.Controllers
{
    public class AvatarController : Controller
    {
        private readonly IAvatarServico _avatarServico;
        private readonly IPretendenteServico _pretendenteServico;
        public AvatarController(
            IAvatarServico avatarServico,
            IPretendenteServico pretendenteServico)
        {
            _avatarServico = avatarServico;
            _pretendenteServico = pretendenteServico;
        }

        public async Task<IActionResult> Alterar(Guid id)
        {
            var pretendente = await _pretendenteServico.ObterAsync(id);
            var model = new AlterarAvatarModel(pretendente.Id, pretendente.Nome);
            return View(model);
        }

        [HttpPost("FileUpload")]
        public async Task<IActionResult> Adicionar(AlterarAvatarModel model)
        {
            var resultado = await _avatarServico.AlterarAsync(model);
            if (resultado.Sucesso)
                return RedirectToAction("index", "pretendentes");

            foreach (string error in resultado.Errors)
                ModelState.AddModelError("", error);
            return View(model);
        }

        [HttpGet]
        public async Task<IActionResult> Imagem(Guid id)
        {
            byte[] img = await _avatarServico.ObterAsync(id);
            if (img != null)
            {
                return File(img, "image/jpeg");
            }
            return File("~/images/capas/capa-vazia.png", "image/png");
        }
    }
}
