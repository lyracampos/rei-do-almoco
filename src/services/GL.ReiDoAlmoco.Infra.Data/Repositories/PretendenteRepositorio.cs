using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GL.ReiDoAlmoco.Domain.Entities;
using GL.ReiDoAlmoco.Domain.Interfaces;
using GL.ReiDoAlmoco.Infra.Data.Context;
using Microsoft.EntityFrameworkCore;

namespace GL.ReiDoAlmoco.Infra.Data.Repositories
{
    public class PretendenteRepositorio : IPretendenteRepositorio
    {
        private readonly ReiDoAlmocoContext _contexto;
        public PretendenteRepositorio(ReiDoAlmocoContext contexto)
        {
            _contexto = contexto;
        }
        public async Task AdicionarAsync(Pretendente pretendente)
        {
            await _contexto.Pretendentes.AddAsync(pretendente);
            await _contexto.SaveChangesAsync();
        }
        public async Task AtualizarAsync(Pretendente pretendente)
        {
            _contexto.Update(pretendente);
            await _contexto.SaveChangesAsync();
        }
        public async Task<IEnumerable<Pretendente>> Listar()
        {
            return await _contexto.Pretendentes.ToArrayAsync();
        }

        public async Task<Pretendente> Obter(Guid id)
        {
            return await _contexto.Pretendentes.FindAsync(id);
        }

        public async Task RemoverAsync(Guid id)
        {
            var pretendente = await Obter(id);
            if(pretendente != null)
            {
                _contexto.Pretendentes.Remove(pretendente);
                await _contexto.SaveChangesAsync();
            }
        }
    }
}