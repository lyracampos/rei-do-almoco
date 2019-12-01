using System;
namespace GL.ReiDoAlmoco.Site.Models.Pretendente
{
    public class PretendenteModel
    {
        public PretendenteModel() { }
        public PretendenteModel(Guid id, string nome, string email)
        {
            Id = id;
            Nome = nome;
            Email = email;
        }
        public Guid Id { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
    }
}