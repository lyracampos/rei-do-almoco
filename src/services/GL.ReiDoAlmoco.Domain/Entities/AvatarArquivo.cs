using System;
using System.IO;
using System.Threading.Tasks;
using FluentValidation;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;

namespace GL.ReiDoAlmoco.Domain.Entities
{
    public class AvatarArquivo
    {
        private readonly IConfiguration _configuration;

        public AvatarArquivo(string diretorio, IConfiguration configuration)
        {
            _configuration = configuration;
            Diretorio = Path.Combine(_configuration["AvatarDiretorioPadrao"], "avatars/", diretorio);
        }
        public AvatarArquivo(string diretorio, IFormFile arquivo, IConfiguration configuration)
            : this(diretorio, configuration)
        {
            Arquivo = arquivo;   
        }

        public string Diretorio { get; private set; }
        public IFormFile Arquivo { get; private set; }
        public string Nome { get{ return "avatar.jpeg"; } }
        public string DiretorioNoProfile { get { return Path.Combine(Directory.GetCurrentDirectory(), "avatars/no-profile.jpeg"); } }

        public async Task<bool> CopiarAvatarAsync()
        {
            CriarDiretorio();
            var path = $"{Diretorio}/{Nome}";
            using (var bits = new FileStream(path, FileMode.Create))
            {
                await Arquivo.CopyToAsync(bits);
                return Directory.Exists(Diretorio);
            }
        }
        public byte[] ObterAvatar()
        {
            var path = Path.Combine(Diretorio, Nome);

            if (!Directory.Exists(Diretorio))
                path = DiretorioNoProfile;

            byte[] data;
            using (StreamReader sr = new StreamReader(path))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    sr.BaseStream.CopyTo(ms);
                    data = ms.ToArray();
                }
            }
            return data;
        }
        public bool RemoverAvatar()
        {
            if (Directory.Exists(Diretorio))
                Directory.Delete(Diretorio, true);

            return !Directory.Exists(Diretorio);
        }
        private bool CriarDiretorio()
        {
            RemoverAvatar();
            if (!Directory.Exists(Diretorio))
                Directory.CreateDirectory(Diretorio);
            return Directory.Exists(Diretorio);
        }
    }

    public class AvatarArquivoValidator : AbstractValidator<AvatarArquivo>
    {
        public AvatarArquivoValidator()
        {
            RuleFor(p => p.Diretorio)
                .NotNull()
                .NotEmpty()
                .WithMessage("O campo diretório é obrigatório.");

            RuleFor(p => p.Nome)
                .NotNull()
                .NotEmpty()
                .WithMessage("O campo nome é obrigatório.");

            RuleFor(p => p.Arquivo)
                .NotNull()
                .WithMessage("O arquivo é obrigatório.");
        }
    }
}
