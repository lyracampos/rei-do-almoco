using System.ComponentModel.DataAnnotations;

namespace GL.ReiDoAlmoco.Site.Models.Pretendente
{
    public class AdicionarModel
    {
        public AdicionarModel()
        {
            
        }
        public AdicionarModel(string nome, string email)
        {
            Nome = nome;
            Email = email;
        }
        [Required(ErrorMessage = "Campo nome é obrigatório")]
        public string Nome { get; set; }

        [Required(ErrorMessage ="Campo e-mail é obrigatório")]
        [EmailAddress(ErrorMessage="Campo e-mail está inválido")]
        public string Email { get; set; }
    }
}