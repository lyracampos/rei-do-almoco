using System;
namespace GL.ReiDoAlmoco.Domain.Shared.Entities
{
    public static class CompararData
    {

        public static bool MaiorIgualHoje(DateTime data) => data.Date >= DateTime.UtcNow.Date;
        public static bool MenorIgualHoje(DateTime data) => data.Date <= DateTime.UtcNow.Date;
    }
}
