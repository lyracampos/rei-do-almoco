using System;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using GL.ReiDoAlmoco.Site.Models.Avatar;
namespace GL.ReiDoAlmoco.Site.Services
{
    public interface IAvatarServico
    {
        Task<RequestResult> AlterarAsync(AlterarAvatarModel model);
        Task<byte[]> ObterAsync(Guid pretendenteId);
    }
}
