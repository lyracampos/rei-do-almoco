using System;
namespace GL.ReiDoAlmoco.Domain.Models
{
    public class EleicaoDoDia
    {
        public EleicaoDoDia(Guid pretendenteId, string nomePretendente)
        {
            PretendenteId = pretendenteId;
            NomePretendente = nomePretendente;
        }
        public EleicaoDoDia(Guid pretendenteId, string nomePretendente, int totalDeVotos, double porcentagem)
            : this(pretendenteId, nomePretendente)
        {
            TotalDeVotos = totalDeVotos;
            Porcentagem = porcentagem;
        }

        public Guid PretendenteId { get; private set; }
        public string NomePretendente { get; private set; }
        public int TotalDeVotos { get; private set; }
        public double Porcentagem { get; private set; }
    }
}