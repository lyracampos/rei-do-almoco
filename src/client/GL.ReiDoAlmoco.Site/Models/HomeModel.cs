using GL.ReiDoAlmoco.Site.Models.Voto;
namespace GL.ReiDoAlmoco.Site.Models
{
    public class HomeModel
    {
        public HomeModel(PeriodoVotacaoModel periodoVotacao, ListaVencedorDiarioModel listaVencedorDia, ListaVencedorSemanalModel listavencedorSemanal)
        {
            PeriodoVotacao = periodoVotacao;
            ListaDeVencedoresDiario = listaVencedorDia;
            ListaDeVencedoresSemanal = listavencedorSemanal;
        }
        public PeriodoVotacaoModel PeriodoVotacao { get; set; }
        public ListaVencedorDiarioModel ListaDeVencedoresDiario { get; set; }
        public ListaVencedorSemanalModel ListaDeVencedoresSemanal { get; set; }
    }
}
