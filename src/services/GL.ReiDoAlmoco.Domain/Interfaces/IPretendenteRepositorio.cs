using System.Collections.Generic;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Entities;

namespace GL.ReiDoAlmoco.Domain.Interfaces
{
    public interface IPretendenteRepositorio
    {
         Task<IEnumerable<Pretendente>> Listar();
         Task<Pretendente> Obter(int id);
         Task AdicionarAsync(Pretendente pretendente);
         Task AtualizarAsync(Pretendente pretendente);
         Task<bool> RemoverAsync(int id);
    }
}