using System;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Site.Models.Pretendente;
using GL.ReiDoAlmoco.Site.Services;
using Microsoft.AspNetCore.Mvc;

namespace GL.ReiDoAlmoco.Site.Controllers
{
    public class PretendentesController : Controller
    {
        private readonly IPretendenteServico _servico;
        public PretendentesController(IPretendenteServico servico)
        {
            _servico = servico;
        }    
        public async Task<IActionResult> Index()
        {
            return View(await _servico.ListarAsync());
        }
        public async Task<IActionResult> Perfil(Guid id)
        {
            var model = await _servico.ObterAsync(id);
            return View(model);
        }
        public IActionResult Adicionar()
        {
            return View(new AdicionarModel("", ""));
        }
        [HttpPost]
        public async Task<IActionResult> Adicionar(AdicionarModel model)
        {
            if(!ModelState.IsValid)
                return View(model);
            
            await _servico.AdicionarAsync(model);
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Editar(Guid id)
        {
            var pretendente = await _servico.ObterAsync(id);
            if(pretendente != null)
            {
                var model = new EditarModel(pretendente.Id, pretendente.Nome);
                return View(model);
            }
            return RedirectToAction("Error", "Home");
        }
        [HttpPost]
        public async Task<IActionResult> Editar(EditarModel model)
        {
            if(!ModelState.IsValid)
                return View(model);
            
            await _servico.AtualizarAsync(model);
            return RedirectToAction("Index");
        }
         public async Task<IActionResult> Remover(Guid id)
        {
            var pretendente = await _servico.ObterAsync(id);
            if(pretendente != null)
            {
                var model = new RemoverModel(pretendente.Id, pretendente.Nome);
                return View(model);
            }
            return RedirectToAction("Error", "Home");
        }
        [HttpPost]
        public async Task<IActionResult> Remover(RemoverModel model)
        {
            if(!ModelState.IsValid)
                return View(model);
            
            await _servico.RemoverAsync(model);
            return RedirectToAction("Index");
        }
    }
}