using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace Web2AP1.API
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
            // var config = new ConfigurationBuilder().AddJsonFile(Directory.GetCurrentDirectory() + "/appsettings.json").Build();
            // var host = new WebHostBuilder()
            //     .UseContentRoot(Directory.GetCurrentDirectory())
            //     .UseConfiguration(config)
            //     .UseKestrel()
            //     .UseIISIntegration()
            //     .UseStartup<Startup>()
            //     .ConfigureKestrel((context, options) =>
            //     {
            //         options.Listen(IPAddress.Any, 5000);
            //     })
            //     .Build();

            // host.Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .ConfigureKestrel(options => options.Listen(IPAddress.Any, 5000))
                .UseStartup<Startup>();
    }
}
