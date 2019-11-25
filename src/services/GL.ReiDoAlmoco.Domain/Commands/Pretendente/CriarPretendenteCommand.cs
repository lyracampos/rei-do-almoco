using System;
using System.ComponentModel.DataAnnotations;
using GL.ReiDoAlmoco.Domain.Commands.Base;

namespace GL.ReiDoAlmoco.Domain.Commands.Pretendente
{
    public class CriarPretendenteCommand : ICommand
    {
        public CriarPretendenteCommand(string nome, string email)
        {
            Nome = nome;
            Email = email;
        }
        [Required(ErrorMessage = "Nome do pretendente é obrigatório.")]
        public string Nome { get; private set; }

        [Required(ErrorMessage = "E-mail do pretendente é obrigatório.")]
        [EmailAddress(ErrorMessage = "E-mail inválido.")]
        public string Email { get; private set; }
    }
}