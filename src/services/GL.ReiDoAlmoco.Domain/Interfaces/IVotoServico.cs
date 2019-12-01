using System.Collections.Generic;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Entities;
using GL.ReiDoAlmoco.Domain.Models;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
namespace GL.ReiDoAlmoco.Domain.Interfaces
{
    public interface IVotoServico
    {
        Task<RequestResult> ComputarAsync(Voto voto);
        Task<ListaDoVencedorDiario> ListarVencedorPorDiaAsync();
        Task<ListaDoVencedorSemanal> ListarVencedorSemanalAsync();
        PeriodoVotacao ObterPeriodoVotacao();
        Task<IEnumerable<EleicaoDoDia>> ObterEleicaoDoDiaAsync();
    }
}