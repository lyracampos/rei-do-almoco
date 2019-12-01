using System;
namespace GL.ReiDoAlmoco.Site.Models.Voto
{
    public class PeriodoVotacaoModel
    {
        public DateTime InicioVotacao { get; set; }
        public DateTime FimVotacao { get; set; }
        public bool VotacaoEncerrada { get; set; }
        public string Mensagem { get; set; }
    }
}