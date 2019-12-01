using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Entities;
using GL.ReiDoAlmoco.Domain.Interfaces;
using GL.ReiDoAlmoco.Domain.Models;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using Microsoft.Extensions.Logging;
using System.Linq;
using System.Collections.Generic;
using System;
using Microsoft.Extensions.Configuration;

namespace GL.ReiDoAlmoco.Domain.Services
{
    public class VotoServico : IVotoServico
    {
        private readonly IVotoRepositorio _votoRepositorio;
        private readonly IPretendenteRepositorio _pretendenteRepositorio;
        private readonly ILogger _logger;
        private readonly IConfiguration _configuration;
        public VotoServico(IVotoRepositorio votoRepositorio, IPretendenteRepositorio pretendenteRepositorio, ILogger<VotoServico> logger, IConfiguration configuration)
        {
            _votoRepositorio = votoRepositorio;
            _pretendenteRepositorio = pretendenteRepositorio;
            _logger = logger;
            _configuration = configuration;
        }

        public PeriodoVotacao ObterPeriodoVotacao()
        {
            return new PeriodoVotacao(_configuration);
        }
        public  async Task<RequestResult> ComputarAsync(Voto voto)
        {
            var pretendente = await _pretendenteRepositorio.ObterAsync(voto.PretendenteId);
            if(pretendente == null)
            {
                _logger.LogError($"[VotoServico - ComputarAsync - Pretendente não encontrado {voto.PretendenteId}");
                return new RequestResult().NotFound();
            }
            var votoDb = await _votoRepositorio.ObterDoDia(voto.PretendenteId);
            if(votoDb == null)
                await _votoRepositorio.AdicionarAsync(voto);
            else
            {
                votoDb.Computar();
                await _votoRepositorio.AtualizarAsync(votoDb);
            }    
            _logger.LogInformation($"Voto computado para o pretendente {voto.PretendenteId}.");
            return new RequestResult().Ok();
        }

        public async Task<ListaDoVencedorDiario> ListarVencedorPorDiaAsync()
        {
            var votos = await _votoRepositorio.ListarAsync();
            if (votos == null || !votos.Any()) return null;

            var resultado = new ListaDoVencedorDiario();

            //agrupa votação por dia e adiciona o vencedor para cada dia
            var votosAgrupados = votos.OrderByDescending(p => p.Data).GroupBy(p => p.Data.Date).ToArray();
            foreach (var votosDoDia in votosAgrupados)
                resultado.AdicionarVencedor(ObterVencedorDiario(votosDoDia));

            return resultado;
        }
        private VencedorDoDia ObterVencedorDiario(IEnumerable<Voto> votos)
        {
            if (votos == null) return null;
            var periodoVotacao = ObterPeriodoVotacao();
            var totalDeVotos = votos.Sum(p => p.Quantidade);
            var vencedor = votos.OrderByDescending(p => p.Quantidade).FirstOrDefault();
            return new VencedorDoDia(
                        vencedor.Data, vencedor.PretendenteId, vencedor.Pretendente.Nome, vencedor.Quantidade,
                        CalcularPorcentagem(vencedor.Quantidade, totalDeVotos), periodoVotacao.VotacaoAberta);
        }
        public async Task<ListaDoVencedorSemanal> ListarVencedorSemanalAsync()
        {
            var votos = await _votoRepositorio.ListarAsync();
            if (votos == null || !votos.Any()) return null;
            var resultado = new ListaDoVencedorSemanal();

            //separa as semanas
            var semanas = ObterSemanas(votos.OrderByDescending(p => p.Data).Select(p => p.Data.Date).Distinct());
                                            //.Select(p => p.Data));

            //agrpua por semanas e identifica o mais votado no período
            foreach (var semana in semanas)
            {
                var votosAgrupados = votos.OrderByDescending(p => p.Data).Where(p => p.Data.Date >= semana.Inicio.Date && p.Data.Date <= semana.Fim.Date).ToArray();
                resultado.AdicionarVencedor(ObterVencedorSeanal(votosAgrupados, semana));
            }
            return resultado;
        }
        private VencedorDaSemana ObterVencedorSeanal(IEnumerable<Voto> votos, DataInicioEFimDaSemana periodo)
        {
            if (votos == null) return null;
            var totalDeVotos = votos.Sum(p => p.Quantidade);
            var emAndamento = (DateTime.UtcNow >= periodo.Inicio && DateTime.UtcNow <= periodo.Fim);
                var vencedor = votos.OrderByDescending(p => p.Quantidade).FirstOrDefault();
            return new VencedorDaSemana(periodo.Inicio, periodo.Fim, vencedor.PretendenteId, vencedor.Pretendente.Nome, vencedor.Quantidade, CalcularPorcentagem(vencedor.Quantidade, totalDeVotos), emAndamento);
        }
        private List<DataInicioEFimDaSemana> ObterSemanas(IEnumerable<DateTime> datas)
        {
            if (datas == null || !datas.Any()) return null;
            var resultado = new List<DataInicioEFimDaSemana>();
            foreach (var data in datas.Select(p => p.Date))
            {
                var existeNaLista = (resultado.Where(p => p.Inicio.Date <= data.Date && p.Fim.Date >= data.Date));
                if (existeNaLista.Any()) continue;
              
                switch (data.DayOfWeek)
                {
                    case DayOfWeek.Sunday:
                        resultado.Add(new DataInicioEFimDaSemana(data, data.AddDays(+6)));
                        break;
                    case DayOfWeek.Monday:
                        resultado.Add(new DataInicioEFimDaSemana(data.AddDays(-1), data.AddDays(+5)));
                        break;
                    case DayOfWeek.Tuesday:
                        resultado.Add(new DataInicioEFimDaSemana(data.AddDays(-2), data.AddDays(+4)));
                        break;
                    case DayOfWeek.Wednesday:
                        resultado.Add(new DataInicioEFimDaSemana(data.AddDays(-3), data.AddDays(+3)));
                        break;
                    case DayOfWeek.Thursday:
                        resultado.Add(new DataInicioEFimDaSemana(data.AddDays(-4), data.AddDays(+2)));
                        break;
                    case DayOfWeek.Friday:
                        resultado.Add(new DataInicioEFimDaSemana(data.AddDays(-5), data.AddDays(+1)));
                        break;
                    case DayOfWeek.Saturday:
                        resultado.Add(new DataInicioEFimDaSemana(data.AddDays(-6), data));
                        break;
                }
            }
            return resultado;
        }
        private double CalcularPorcentagem(int votos, int total)
        {
            var porcentagem = (votos * 100) / total;
            return porcentagem;
        }

        public async Task<IEnumerable<EleicaoDoDia>> ObterEleicaoDoDiaAsync()
        {
            var pretendentes = await _pretendenteRepositorio.ListarAsync();
            var votos = await _votoRepositorio.ListarDoDiaAsync();
            var resultado = new List<EleicaoDoDia>();
            foreach (var pretendente in pretendentes)
            {
                var voto = votos.FirstOrDefault(p => p.PretendenteId == pretendente.Id);
                if(voto != null)
                {
                    var totalDeVotos = votos.Sum(p => p.Quantidade);
                    resultado.Add(
                        new EleicaoDoDia(pretendente.Id, pretendente.Nome, voto.Quantidade, CalcularPorcentagem(voto.Quantidade, totalDeVotos)));
                }
                else resultado.Add(new EleicaoDoDia(pretendente.Id, pretendente.Nome));
            }
            return resultado.ToArray();
        }
    }

    public class DataInicioEFimDaSemana
    {
        public DataInicioEFimDaSemana()
        {

        }

        public DataInicioEFimDaSemana(DateTime inicio, DateTime fim)
        {
            Inicio = inicio;
            Fim = fim;
        }

        public DateTime Inicio { get; set; }
        public DateTime Fim { get; set; }

        public void SetInicio(DateTime data)
        {
            Inicio = data;
        }
        public void SetFim(DateTime data)
        {
            Fim = data;
        }
    }
}