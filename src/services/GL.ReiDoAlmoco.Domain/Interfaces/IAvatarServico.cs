using System;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Shared.Entities;
using Microsoft.AspNetCore.Http;

namespace GL.ReiDoAlmoco.Domain.Interfaces
{
    public interface IAvatarServico
    {
        Task<RequestResult> AdicionarAsync(Guid pretendenteId, IFormFile arquivo);
        byte[] Obter(Guid pretendenteId);
        RequestResult Remover(Guid pretendenteId);
    }
}
