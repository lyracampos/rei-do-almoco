using System;
using GL.ReiDoAlmoco.Domain.Interfaces;
using GL.ReiDoAlmoco.Infra.Data.Context;
using GL.ReiDoAlmoco.Infra.Data.Repositories;
using GL.ReiDoTrono.Infra.Services.Services;
using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace GL.ReiDoAlmoco.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            var assembly = AppDomain.CurrentDomain.Load("GL.ReiDoAlmoco.Api");
            services.AddMediatR(assembly);
            
            services.AddScoped<ReiDoAlmocoContext>();
            services.AddScoped<IPretendenteRepositorio, PretendenteRepositorio>();
            services.AddScoped<IAvatarServico, AvatarServico>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();
            app.UseStaticFiles();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
