using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using GL.ReiDoAlmoco.Site.Models.Voto;
namespace GL.ReiDoAlmoco.Site.Services
{
    public interface IVotoServico
    {
        Task<ListaVencedorDiarioModel> ListarVencedorDiarioAsync();
        Task<ListaVencedorSemanalModel> ListarVencedorSemanalAsync();
        Task<RequestResult> VotarAsync(Guid pretendenteId);
        Task<PeriodoVotacaoModel> ObterPeriodoVotacao();
        Task<IEnumerable<EleicaoDoDiaModel>> ObterEleicaoDoDia();
    }
}
