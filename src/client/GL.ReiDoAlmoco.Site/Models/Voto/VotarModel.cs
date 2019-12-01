using System.Collections.Generic;
using System.Linq;
using GL.ReiDoAlmoco.Site.Models.Pretendente;
namespace GL.ReiDoAlmoco.Site.Models.Voto
{
    public class VotarModel
    {
        public VotarModel(IEnumerable<EleicaoDoDiaModel> resultadoDoDia, PeriodoVotacaoModel periodoVotacao)
        {
            ResultadoDoDia = resultadoDoDia;
            PeriodoVotacao = periodoVotacao;
        }
        public PeriodoVotacaoModel PeriodoVotacao { get; private set; }
        public IEnumerable<EleicaoDoDiaModel> ResultadoDoDia { get; private set; }
        public bool TemResultado { get { return (ResultadoDoDia != null && ResultadoDoDia.Any()); } }
    }
}