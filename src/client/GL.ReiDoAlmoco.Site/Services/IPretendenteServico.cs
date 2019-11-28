using System;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using GL.ReiDoAlmoco.Site.Models.Pretendente;

namespace GL.ReiDoAlmoco.Site.Services
{
    public interface IPretendenteServico
    {
        Task<PretendenteListaModel> ListarAsync();
        Task<PretendenteModel> ObterAsync(Guid id);
        Task<RequestResult> AdicionarAsync(AdicionarModel model);
        Task<RequestResult> AtualizarAsync(EditarModel model);
        Task<RequestResult> RemoverAsync(RemoverModel id);
    }
}