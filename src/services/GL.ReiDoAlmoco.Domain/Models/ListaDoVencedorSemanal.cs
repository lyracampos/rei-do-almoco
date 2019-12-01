using System;
using System.Collections.Generic;

namespace GL.ReiDoAlmoco.Domain.Models
{
    public class ListaDoVencedorSemanal
    {
        public ListaDoVencedorSemanal()
        {
        }
        public List<VencedorDaSemana> ListaDeVencedores { get; set; }
        public void AdicionarVencedor(VencedorDaSemana vencedor)
        {
            ListaDeVencedores = (ListaDeVencedores ?? new List<VencedorDaSemana>());
            ListaDeVencedores.Add(vencedor);
        }
    }

    public class VencedorDaSemana
    {
        public VencedorDaSemana(DateTime inicioDaSemana, DateTime fimDaSemana, Guid pretendenteId, string nomePretendente, int totalDeVotos, double porcentagem, bool emAndamento)
        {
            InicioDaSemana = inicioDaSemana;
            FimDaSemana = fimDaSemana;
            PretendenteId = pretendenteId;
            NomePretendente = nomePretendente;
            TotalDeVotos = totalDeVotos;
            Porcentagem = porcentagem;
            EmAndamento = emAndamento;
        }

        public DateTime InicioDaSemana { get; private set; }
        public DateTime FimDaSemana { get; private set; }
        public Guid PretendenteId { get; private set; }
        public string NomePretendente { get; private set; }
        public int TotalDeVotos { get; private set; }
        public double Porcentagem { get; private set; }
        public bool EmAndamento { get; private set; }
    }
}
