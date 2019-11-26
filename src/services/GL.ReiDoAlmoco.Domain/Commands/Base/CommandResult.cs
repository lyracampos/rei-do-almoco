namespace GL.ReiDoAlmoco.Domain.Commands.Base
{
    public class CommandResult
    {
        public CommandResult(bool sucesso, string mensagem)
        {
            this.Sucesso = sucesso;
            this.Mensagem = mensagem;
        }
        public bool Sucesso { get; private set; }
        public string Mensagem { get; private set; }
    }
}