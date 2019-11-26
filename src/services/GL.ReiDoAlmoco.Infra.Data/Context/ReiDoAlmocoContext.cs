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
        }

        public DbSet<Pretendente> Pretendentes { get; set; }
    }
}