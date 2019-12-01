using System;
using System.Net;

namespace GL.ReiDoAlmoco.Domain.Shared.Entities
{
    public class RequestResult
    {
        public bool Sucesso { get; set; }
        public string Mensagem { get; set; }
        public HttpStatusCode StatusCode { get; set; }
        public string[] Errors { get; set; }

        public RequestResult Ok()
        {
            Sucesso = true;
            Mensagem = "Operação realizada com sucesso.";
            StatusCode = HttpStatusCode.OK;
            return this;
        }
        public RequestResult BadRequest(string[] errors)
        {
            Sucesso = false;
            Mensagem = "Ops, algo deu errado.";
            StatusCode = HttpStatusCode.BadRequest;
            Errors = errors;
            return this;
        }
        public RequestResult NotFound()
        {
            Sucesso = false;
            Mensagem = $"Objeto não encontrado.";
            StatusCode = HttpStatusCode.NotFound;
            return this;
        }
    }
}
