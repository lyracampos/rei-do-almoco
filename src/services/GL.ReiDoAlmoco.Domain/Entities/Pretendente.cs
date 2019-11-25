using System;
using FluentValidation;
namespace GL.ReiDoAlmoco.Domain.Entities
{
    public class Pretendente
    {
        public Pretendente(string nome, string email)
        {
            Id = Guid.NewGuid();
            Nome = nome;
            Email = email;
        }
        public Guid Id { get; private set; }
        public string Nome { get; private set; }
        public string Email { get; private set; }
        public void AtualizarNome(string nome)
        {
            Nome = nome;
        }
    }

    public class PretendenteValidator : AbstractValidator<Pretendente>
    {
        public PretendenteValidator()
        {
            RuleFor(p => p.Nome)
                .NotEmpty()
                .NotNull()
                    .WithMessage("Nome do pretendente é obrigatório.");

            RuleFor(p => p.Email)
                .NotEmpty()
                .NotNull()
                    .WithMessage("Campo e-mail do pretendente é obrigatório.")
                .EmailAddress()
                    .WithMessage("Campo e-mail do pretendente é inválido.");

        } 
    }
}
