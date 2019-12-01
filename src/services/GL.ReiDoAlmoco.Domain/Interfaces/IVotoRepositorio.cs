using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Entities;
namespace GL.ReiDoAlmoco.Domain.Interfaces
{
    public interface IVotoRepositorio
    {
        Task<IEnumerable<Voto>> ListarAsync();
        Task<Voto> ObterDoDia(Guid pretendenteId);
        Task<IEnumerable<Voto>> ListarDoDiaAsync();
        Task AdicionarAsync(Voto voto);
        Task AtualizarAsync(Voto voto);
    }
}