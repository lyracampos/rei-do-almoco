namespace GL.ReiDoAlmoco.Domain.Commands.Base
{
    public class CommandResult
    {
        public bool Sucesso { get; private set; }
        public string Mensagem { get; private set; }
    }
}