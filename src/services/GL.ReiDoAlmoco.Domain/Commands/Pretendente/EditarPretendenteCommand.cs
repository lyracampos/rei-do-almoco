using System;
using System.ComponentModel.DataAnnotations;
using GL.ReiDoAlmoco.Domain.Commands.Base;
namespace GL.ReiDoAlmoco.Domain.Commands.Pretendente
{
    public class EditarPretendenteCommand : ICommand
    {
        public EditarPretendenteCommand()
        {

        }
        public EditarPretendenteCommand(Guid id, string nome)
        {
            Id = id;
            Nome = nome;
        }

        public Guid Id { get; set; }

        [Required(ErrorMessage = "Nome do pretendente é obrigatório.")]
        public string Nome { get; set; }
    }
}