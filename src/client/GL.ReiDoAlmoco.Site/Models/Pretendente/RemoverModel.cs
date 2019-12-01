using System;
namespace GL.ReiDoAlmoco.Site.Models.Pretendente
{
    public class RemoverModel
    {
        public RemoverModel()
        {

        }
        public RemoverModel(Guid id, string nome)
        {
            Id = id;
            Nome = nome;
        }
        public Guid Id { get; set; }
        public string Nome { get; set; }
    }
}