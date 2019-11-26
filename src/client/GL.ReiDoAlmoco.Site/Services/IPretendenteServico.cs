using System;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Site.Models.Pretendente;

namespace GL.ReiDoAlmoco.Site.Services
{
    public interface IPretendenteServico
    {
        Task<PretendenteListaModel> ListarAsync();
        Task<PretendenteModel> ObterAsync(Guid id);
        Task AdicionarAsync(AdicionarModel model);
        Task AtualizarAsync(EditarModel model);
        Task RemoverAsync(RemoverModel id);

    }
}