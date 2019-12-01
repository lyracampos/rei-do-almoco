using System;
using GL.ReiDoAlmoco.Domain.Commands.Base;

namespace GL.ReiDoAlmoco.Domain.Commands.Pretendente
{
    public class RemoverPretendenteCommand : ICommand
    {
        public RemoverPretendenteCommand(Guid id)
        {
            Id = id;
        }
        public Guid Id { get; private set; }
    }
}