using System;

namespace GL.ReiDoAlmoco.Site.Models.Voto
{
    public class EleicaoDoDiaModel
    {
        public Guid PretendenteId { get;  set; }
        public string NomePretendente { get;  set; }
        public int TotalDeVotos { get;  set; }
        public double Porcentagem { get;  set; }
    }
}