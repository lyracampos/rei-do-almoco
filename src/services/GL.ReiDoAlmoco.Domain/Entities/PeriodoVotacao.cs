using System;
using Microsoft.Extensions.Configuration;
namespace GL.ReiDoAlmoco.Domain.Entities
{
    public class PeriodoVotacao
    {
        private readonly IConfiguration _configuration;
        public PeriodoVotacao(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public DateTime InicioVotacao { get { return ObterValorData(true); } }
        public DateTime FimVotacao { get { return ObterValorData(false); } }
        public bool VotacaoAberta
        {
            get
            {
                if (DateTime.UtcNow >= InicioVotacao &&
                        DateTime.UtcNow <= FimVotacao)
                    return true;
                return false;
            }
        }
        public bool VotacaoEncerrada
        {
            get
            {
                if (DateTime.UtcNow <= InicioVotacao ||
                        DateTime.UtcNow >= FimVotacao)
                    return true;
                return false;
            }
        }
        public string Mensagem
        {
            get
            {
                return VotacaoEncerrada ? 
                    $"As votações foram encerradas. Novas eleições a partir das {InicioVotacao.ToString("HH:mm")} ao {FimVotacao.ToString("HH:mm")}." :
                    "Eleições para o Rei do Almoço estão abertas.";
            }
        }

        public DateTime ObterValorData(bool dataInicio)
        {
            var hoje = DateTime.Today;
            try
            {
                var config = dataInicio ?
                            _configuration.GetSection("PeriodoDeVotacao:Inicio").Value :
                            _configuration.GetSection("PeriodoDeVotacao:Fim").Value;

                var valores = config.Split(':');
                int hora = int.Parse(valores.GetValue(0).ToString());
                int minuto = int.Parse(valores.GetValue(1).ToString());
                return new DateTime(hoje.Year, hoje.Month, hoje.Day, hora, minuto, 0);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return dataInicio ?
                            new DateTime(hoje.Year, hoje.Month, hoje.Day, 10, 00, 0) :
                            new DateTime(hoje.Year, hoje.Month, hoje.Day, 12, 00, 0);
            }
        }
    }
}