using GL.ReiDoAlmoco.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
namespace GL.ReiDoAlmoco.Infra.Data.Context
{
    public class ReiDoAlmocoContext : DbContext
    {
        private readonly IConfiguration _configuration;
        public ReiDoAlmocoContext()
        {

        }
        public ReiDoAlmocoContext(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=localhost;Database=Rei-Do-Almoco;MultipleActiveResultSets=true;User Id=sa;Password=P@55w0rd");
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            var pretendente = modelBuilder.Entity<Pretendente>();
            pretendente.HasKey(p => p.Id);
            pretendente.ToTable("Pretendente");
            pretendente.Property(p => p.Nome).IsRequired().HasColumnType("nvarchar(100)");
            pretendente.Property(p => p.Email).IsRequired().HasColumnType("nvarchar(100)");

            var voto = modelBuilder.Entity<Voto>();
            voto.HasKey(p => p.Id);
            voto.ToTable("Voto");
            voto.Property(p => p.Quantidade).IsRequired();
            voto.Property(p => p.PretendenteId).IsRequired();
            voto.Property(p => p.Data).IsRequired();
        }

        public DbSet<Pretendente> Pretendentes { get; set; }
        public DbSet<Voto> Votos { get; set; }
    }
}