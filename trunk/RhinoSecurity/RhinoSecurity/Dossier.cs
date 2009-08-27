using System;
using NHibernate.Criterion;
using Rhino.Commons;
using Rhino.Security.Interfaces;

namespace RhinoSecurity
{
    public class Dossier
    {
        public virtual long Id { get; set; }
        public virtual string Name { get; set; }
        public virtual Guid SecurityKey { get; set; }

        public Dossier()
        {
            SecurityKey = Guid.NewGuid();
        }

        public Dossier(string name) : this()
        {
            Name = name;
        }
    }

    public class DossierEntityInformationExtractor : IEntityInformationExtractor<Dossier>
    {
        private readonly IRepository<Dossier> repository;

        public DossierEntityInformationExtractor(IRepository<Dossier> repository)
        {
            this.repository = repository;
        }

        public Guid GetSecurityKeyFor(Dossier dossier)
        {
            return dossier.SecurityKey;
        }

        public string GetDescription(Guid securityKey)
        {
            var wine = repository.FindOne(Restrictions.Eq("SecurityKey", securityKey));
            return string.Format("Wine: {0}", wine.Name);
        }

        public string SecurityKeyPropertyName
        {
            get { return "SecurityKey"; }
        }
    }
}