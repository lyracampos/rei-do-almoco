using System.Collections.Generic;
using System.Linq;
namespace GL.ReiDoAlmoco.Site.Models.Pretendente
{
    public class PretendenteListaModel
    {
        public PretendenteListaModel(IEnumerable<PretendenteModel> pretendentes)
        {
            Pretendentes = new List<PretendenteModel>();
            if (pretendentes != null)
                Pretendentes.AddRange(pretendentes.Select(p => new PretendenteModel(p.Id, p.Nome, p.Email)));
        }
        public List<PretendenteModel> Pretendentes { get;  set; }
        public bool TemPretendente
        {
            get
            {
                return (Pretendentes != null && Pretendentes.Any());
            }
        }   
    }
}