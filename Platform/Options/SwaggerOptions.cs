using Microsoft.Extensions.Configuration;

namespace Platform.Options;

public class SwaggerOptions : AbstractOptions
{
    public string ApplicationName { get; init; } = null!;
    
    public SwaggerOptions(IConfiguration configuration) : base(configuration)
    {
    }
}
