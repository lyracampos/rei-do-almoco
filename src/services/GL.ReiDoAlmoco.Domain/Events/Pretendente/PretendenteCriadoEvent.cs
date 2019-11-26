using GL.ReiDoAlmoco.Domain.Events.Base;

namespace GL.ReiDoAlmoco.Domain.Events.Pretendente
{
    public class PretendenteCriadoEvent : IEvent
    {
        public PretendenteCriadoEvent(string nome, string email)
        {
            Nome = nome;
            Email = email;
        }
        public string Nome { get; private set; }
        public string Email { get; private set; }
    }
}