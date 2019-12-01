using System;
using System.IO;
using Microsoft.AspNetCore.Http;
namespace GL.ReiDoAlmoco.Site.Models.Avatar
{
    public class AlterarAvatarModel
    {
        public AlterarAvatarModel()
        {
        }
        public AlterarAvatarModel(Guid idDoPretendente, string nomeDoPretendente)
        {
            IdDoPretendente = idDoPretendente;
            NomeDoPretendente = nomeDoPretendente;
        }
        public Guid IdDoPretendente { get; set; }
        public string NomeDoPretendente { get; set; }
        public IFormFile Arquivo { get; set; }

        public static byte[] ArquivoToByte(IFormFile arquivo)
        {
            byte[] data;
            using (var br = new BinaryReader(arquivo.OpenReadStream()))
                data = br.ReadBytes((int)arquivo.OpenReadStream().Length);

            return data;
        }
    }
}
