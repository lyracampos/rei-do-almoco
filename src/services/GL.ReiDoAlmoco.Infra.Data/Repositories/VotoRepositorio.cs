using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Entities;
using GL.ReiDoAlmoco.Domain.Interfaces;
using GL.ReiDoAlmoco.Infra.Data.Context;
using Microsoft.EntityFrameworkCore;

namespace GL.ReiDoAlmoco.Infra.Data.Repositories
{
    public class VotoRepositorio : IVotoRepositorio
    {
        private readonly ReiDoAlmocoContext _contexto;
        public VotoRepositorio(ReiDoAlmocoContext contexto)
        {
            _contexto = contexto;
        }
        public async Task AdicionarAsync(Voto voto)
        {
            await _contexto.Votos.AddAsync(voto);
            await _contexto.SaveChangesAsync();
        }
        public async Task AtualizarAsync(Voto voto)
        {
            _contexto.Votos.Update(voto);
            await _contexto.SaveChangesAsync();
        }
       
        public async Task<IEnumerable<Voto>> ListarAsync()
        {
            return await _contexto.Votos.Include(p => p.Pretendente).ToArrayAsync();
        }

        public async Task<IEnumerable<Voto>> ListarDoDiaAsync()
        {
            return await _contexto.Votos.Where(p => p.Data.Date == DateTime.Today.Date).ToArrayAsync();
        }

        public async Task<Voto> ObterDoDia(Guid pretendenteId)
        {
            return await _contexto.Votos
                                .Include(c => c.Pretendente)
                                .Where(p => p.Data.Date == DateTime.Today.Date && p.PretendenteId == pretendenteId)
                                .FirstOrDefaultAsync();
        }
    }
}