using System;
using System.ComponentModel.DataAnnotations;

namespace GL.ReiDoAlmoco.Site.Models.Pretendente
{
    public class EditarModel
    {
        public EditarModel()
        {
            
        }
        public EditarModel(Guid id, string nome)
        {
            Id = id;
            Nome = nome;
        }
        public Guid Id { get; set; }
        [Required(ErrorMessage = "Campo nome é obrigatório")]
        public string Nome { get; set; }
    }
}