using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.DependencyInjection;

var host = new HostBuilder()
    .ConfigureFunctionsWorkerDefaults()
    .ConfigureServices(services => {
        // register HttpClient and other shared services here
        services.AddHttpClient();
    })
    .Build();
nhost.Run();
