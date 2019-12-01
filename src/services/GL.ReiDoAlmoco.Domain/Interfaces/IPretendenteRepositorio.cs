using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Entities;

namespace GL.ReiDoAlmoco.Domain.Interfaces
{
    public interface IPretendenteRepositorio
    {
         Task<IEnumerable<Pretendente>> ListarAsync();
         Task<Pretendente> ObterAsync(Guid id);
         Task<Pretendente> ObterPorEmailAsync(string email);
         Task AdicionarAsync(Pretendente pretendente);
         Task AtualizarAsync(Pretendente pretendente);
         Task RemoverAsync(Guid id);
    }
}