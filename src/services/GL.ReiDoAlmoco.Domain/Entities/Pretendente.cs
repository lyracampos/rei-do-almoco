using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using FluentValidation;
using GL.ReiDoAlmoco.Domain.Interfaces;

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
        public virtual ICollection<Voto> Votos { get; set; }
        public void AtualizarNome(string nome)
        {
            Nome = nome;
        }
    }

    public class PretendenteValidator : AbstractValidator<Pretendente>
    {
        private readonly IPretendenteRepositorio _repositorio;
        
        public PretendenteValidator(IPretendenteRepositorio repositorio)
        {
            _repositorio = repositorio;

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

            RuleFor(p => new { p.Id, p.Email }).Must(c => EmailDisponivel(c.Id, c.Email).Result)
                .WithMessage("E-mail informado já esta em uso.");
        } 
        public async Task<bool> EmailDisponivel(Guid id, string email)
        {
            var pretendente = await _repositorio.ObterPorEmailAsync(email);
            if(pretendente == null) return true;
            return (pretendente.Id == id);
        }
    }
}
