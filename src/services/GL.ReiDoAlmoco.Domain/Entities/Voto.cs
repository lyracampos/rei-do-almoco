using System;
using FluentValidation;
namespace GL.ReiDoAlmoco.Domain.Entities
{
    public class Voto
    {
        public Voto()
        {
            Id = Guid.NewGuid();
            Data = DateTime.UtcNow;
        }
        public Voto(Guid pretendenteId)
            :this()
        {
            PretendenteId = pretendenteId;
            Quantidade = 1;
        }
        public Guid Id { get; private set; }
        public DateTime Data { get; private set; }
        public int Quantidade { get; private set; }
        public Guid PretendenteId { get; private set; }
        public Pretendente Pretendente { get; set; }

        public void Computar()
        {
            Quantidade++;
        }
    }

    public class VotoValidator : AbstractValidator<Voto>
    {
        public VotoValidator()
        {
            RuleFor(p => p.Data)
                .GreaterThanOrEqualTo(DateTime.UtcNow)
                .WithMessage("Data de votação deve ser maior ou igual a data atual.");

            RuleFor(p => p.Quantidade)
                .GreaterThan(0)
                .WithMessage("Quantidade deve ser maior que 0.");
        }
    }
}