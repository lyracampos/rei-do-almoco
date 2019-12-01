using System;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Site.Models.Voto;
using GL.ReiDoAlmoco.Site.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace GL.ReiDoAlmoco.Site.Controllers
{
    public class VotoController : Controller
    {
        private readonly IConfiguration _configuration;
        private readonly IPretendenteServico _pretendenteServico;
        private readonly IVotoServico _votoServico;
        public VotoController(IConfiguration configuration, IPretendenteServico pretendenteServico, IVotoServico votoServico)
        {
            _configuration = configuration;
            _pretendenteServico = pretendenteServico;
            _votoServico = votoServico;
        }

        public async Task<IActionResult> Votar()
        {
            var periodoVotacao = await _votoServico.ObterPeriodoVotacao();
            var resultadoEleicaoDoDia = await _votoServico.ObterEleicaoDoDia();
            var model = new VotarModel(resultadoEleicaoDoDia, periodoVotacao);
            return View(model);
        }

        [HttpPost]
        public async Task<bool> Votar(Guid pretendenteId)
        {
            var resultado = await _votoServico.VotarAsync(pretendenteId);
            return resultado.Sucesso;
        }

        public IActionResult VotoConfirmado()
        {
            return View();
        }
    }
}