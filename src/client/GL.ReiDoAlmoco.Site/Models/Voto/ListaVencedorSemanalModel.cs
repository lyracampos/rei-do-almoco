using System;
using System.Collections.Generic;
using System.Linq;

namespace GL.ReiDoAlmoco.Site.Models.Voto
{
    public class ListaVencedorSemanalModel
    {
        public ListaVencedorSemanalModel()
        {
            ListaDeVencedores = new List<VencedorDaSemana>();
        }
        public List<VencedorDaSemana> ListaDeVencedores { get; set; }
        public bool TemResultado { get { return (ListaDeVencedores != null && ListaDeVencedores.Any()); } }
    }

    public class VencedorDaSemana
    {

        public DateTime InicioDaSemana { get; set; }
        public DateTime FimDaSemana { get; set; }
        public Guid PretendenteId { get; set; }
        public string NomePretendente { get; set; }
        public int TotalDeVotos { get; set; }
        public double Porcentagem { get; set; }
        public bool EmAndamento { get; set; }

        public string FormatarData(DateTime data)
        {
            if (data == null) return string.Empty;
            return data.ToString("dd/MM/yyyy");
        }
    }
}