using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using GL.ReiDoAlmoco.Site.Models;
using GL.ReiDoAlmoco.Site.Services;
using GL.ReiDoAlmoco.Site.Models.Voto;
using Microsoft.Extensions.Configuration;

namespace GL.ReiDoAlmoco.Site.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger _logger;
        private readonly IVotoServico _votoServico;
        private readonly IConfiguration _configuration;

        public HomeController(ILogger<HomeController> logger, IVotoServico votoServico, IConfiguration configuration)
        {
            _logger = logger;
            _votoServico = votoServico;
            _configuration = configuration;
        }

        public async Task<IActionResult> Index()
        {
            var vencedoresDiarios = await _votoServico.ListarVencedorDiarioAsync() ?? new ListaVencedorDiarioModel();
            var vencedoresSemanais = await _votoServico.ListarVencedorSemanalAsync() ?? new ListaVencedorSemanalModel();
            var periodoVotacao = await _votoServico.ObterPeriodoVotacao();
            var model = new HomeModel(periodoVotacao, vencedoresDiarios, vencedoresSemanais);
            return View(model);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
