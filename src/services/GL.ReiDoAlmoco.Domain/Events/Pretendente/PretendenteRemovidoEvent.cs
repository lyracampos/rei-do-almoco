using System;
using GL.ReiDoAlmoco.Domain.Events.Base;
namespace GL.ReiDoAlmoco.Domain.Events.Pretendente
{
    public class PretendenteRemovidoEvent : IEvent
    {
        public PretendenteRemovidoEvent(Guid id)
        {
            this.Id = id;
        }
        public Guid Id { get; private set; }
    }
}