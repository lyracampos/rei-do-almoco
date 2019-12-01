using System;
using System.Collections.Generic;

namespace GL.ReiDoAlmoco.Domain.Models
{
    public class ListaDoVencedorDiario
    {
        public ListaDoVencedorDiario()
        {
        }
        public List<VencedorDoDia> ListaDeVencedores { get; set; }

        public void AdicionarVencedor(VencedorDoDia vencedor)
        {
            ListaDeVencedores = (ListaDeVencedores ?? new List<VencedorDoDia>());
            ListaDeVencedores.Add(vencedor);
        }
    }
    public class VencedorDoDia
    {
        public VencedorDoDia(DateTime dia, Guid pretendenteId, string nomePretendente, int totalDeVotos, double porcentagem, bool emAndamento)
        {
            Dia = dia;
            PretendenteId = pretendenteId;
            NomePretendente = nomePretendente;
            TotalDeVotos = totalDeVotos;
            Porcentagem = porcentagem;
            EmAndamento = emAndamento;
        }

        public DateTime Dia { get; private set; }
        public Guid PretendenteId { get; private set; }
        public string NomePretendente { get; private set; }
        public int TotalDeVotos { get; private set; }
        public double Porcentagem { get; private set; }
        public bool EmAndamento { get; private set; }
    }
}
