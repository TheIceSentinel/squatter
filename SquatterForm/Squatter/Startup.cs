using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Squatter.Startup))]
namespace Squatter
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
