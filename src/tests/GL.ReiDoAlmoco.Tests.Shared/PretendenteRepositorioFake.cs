using System.Collections.Generic;
using System.Linq;

namespace GL.ReiDoAlmoco.Tests.Shared
{
    public class PretendenteRepositorioFake
    {
        public IEnumerable<Domain.Entities.Pretendente> ListarPretendentes()
        {
            var lista = new List<Domain.Entities.Pretendente>
            {
                new Domain.Entities.Pretendente("Nome pretendente 1", "emailpretendente1@dominio.com.br"),
                new Domain.Entities.Pretendente("Nome pretendente 2", "emailpretendente2@dominio.com.br"),
                new Domain.Entities.Pretendente("Nome pretendente 3", "emailpretendente3@dominio.com.br")
            };
            return lista.ToArray();
        }
        public IEnumerable<Domain.Entities.Pretendente> ListarPretendentesNull()
        {
            return null;
        }
        public Domain.Entities.Pretendente ObterUmPretendente()
        {
            return ListarPretendentes().FirstOrDefault();
        }
        public Domain.Entities.Pretendente ObterUmPretendenteNull()
        {
            return null;
        }
    }
}
