using MediatR;
namespace GL.ReiDoAlmoco.Domain.Commands.Base
{
    public interface ICommand : IRequest<CommandResult>
    {
        
    }
}