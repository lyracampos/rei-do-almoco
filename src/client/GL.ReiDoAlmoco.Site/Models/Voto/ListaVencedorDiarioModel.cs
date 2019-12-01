using System;
using System.Collections.Generic;
using System.Linq;
namespace GL.ReiDoAlmoco.Site.Models.Voto
{
    public class ListaVencedorDiarioModel
    {
        public ListaVencedorDiarioModel()
        {
            ListaDeVencedores = new List<VencedorDoDia>();
        }
        public bool TemResultado { get  { return (ListaDeVencedores != null && ListaDeVencedores.Any()); } }
        public List<VencedorDoDia> ListaDeVencedores { get; set; }
    }

    public class VencedorDoDia
    {
        public DateTime Dia { get; set; }
        public Guid PretendenteId { get; set; }
        public string NomePretendente { get; set; }
        public int TotalDeVotos { get; set; }
        public double Porcentagem { get; set; }
        public bool EmAndamento { get; set; }

        public string FormatarData(DateTime data)
        {
            if(data == null) return string.Empty;
            return data.ToString("dd/MM/yyyy");
        }
    }
}