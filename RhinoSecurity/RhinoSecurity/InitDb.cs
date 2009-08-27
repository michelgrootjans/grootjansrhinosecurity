using Castle.MicroKernel.Registration;
using Castle.Windsor;
using NHibernate;
using NHibernate.Cfg;
using NHibernate.Tool.hbm2ddl;
using Rhino.Commons;

namespace RhinoSecurity
{
    public class DbSchema
    {
        public void Generate(IWindsorContainer container)
        {
            //throw new Exception("Config init: Read below...");
            //create first an empty DB with following name: Rhino_Security 
            //(edit other connection string proprities in hibernate.cfg.xml file if its necessary)
            container.Kernel.Register(
                Component.For<INHibernateInitializationAware>()
                    .ImplementedBy<NHibernateDbSchemaGeneration>());
        }
    }

    internal class NHibernateDbSchemaGeneration : INHibernateInitializationAware
    {
        public void BeforeInitialization()
        {
        }

        public void Configured(Configuration cfg)
        {
            new SchemaExport(cfg).Create(false, true);
        }

        public void Initialized(Configuration cfg, ISessionFactory sessionFactory)
        {
        }
    }
}