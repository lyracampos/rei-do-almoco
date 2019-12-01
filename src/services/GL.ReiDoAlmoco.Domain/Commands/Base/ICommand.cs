using GL.ReiDoAlmoco.Domain.Shared.Entities;
using MediatR;
namespace GL.ReiDoAlmoco.Domain.Commands.Base
{
    public interface ICommand : IRequest<RequestResult>
    {
        
    }
}