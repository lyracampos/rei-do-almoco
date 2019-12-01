using System;
using GL.ReiDoAlmoco.Domain.Events.Base;
namespace GL.ReiDoAlmoco.Domain.Events.Pretendente
{
    public class PretendenteEditadoEvent : IEvent
    {
        public PretendenteEditadoEvent(Guid id, string nome)
        {
            this.Nome = nome;
        }
        public Guid Id { get; private set; }
        public string Nome { get; private set; }
    }
}