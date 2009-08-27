using System;
using Castle.MicroKernel.Registration;
using Castle.Windsor;
using NHibernate;
using NUnit.Framework;
using Rhino.Commons;
using Rhino.Commons.Facilities;
using Rhino.Security;
using Rhino.Security.Interfaces;
using Rhino.Security.Model;

namespace RhinoSecurity
{
    [TestFixture]
    public abstract class SecurityTest
    {
        private static bool hasBeenInitialized;

        protected IAuthorizationRepository authorizationRepository;
        protected IPermissionsBuilderService permissionsBuilderService;
        protected IPermissionsService permissionService;
        protected IAuthorizationService authorizationService;

        private IWindsorContainer container;
        protected IUnitOfWork unitOfWOrk;

        protected User user;
        protected UsersGroup admins;
        protected UsersGroup guests;
        protected Operation manageDossier;
        protected Operation viewDossier;
        protected ISession session;
        protected Operation allDossierOperations;

        [SetUp]
        public void SetUp()
        {
            InitApplication();
            ResolveServices();

            //Start Rhino Common Unit Of Work Session            
            unitOfWOrk = UnitOfWork.Start();

            //Create a User
            user = new User {Name = ("George W.")};
            UnitOfWork.CurrentSession.Save(user);
            //Create "AdminUserGroup" UsersGroup                  
            admins = authorizationRepository.CreateUsersGroup("admins");
            Commit();
            //Create Child group for "AdminUserGroup"
            guests = authorizationRepository.CreateChildUserGroupOf(admins.Name, "guests");
            //Create two operations: root /Dossier          operation 
            //              and its child /Dossier/Manage   operation
            manageDossier = authorizationRepository.CreateOperation("/Dossier/Manage");
            allDossierOperations = manageDossier.Parent;
            Commit();
            //Create third operation as child of the /Dossier
            viewDossier = authorizationRepository.CreateOperation("/Dossier/View");
            Commit();

            PrepareData();
            Commit();
            session = UnitOfWork.CurrentSession;
        }

        protected void Commit()
        {
            UnitOfWork.Current.TransactionalFlush();
        }

        protected virtual void PrepareData()
        {
        }

        protected object Save(Object o)
        {
            UnitOfWork.CurrentSession.Save(o);
            return UnitOfWork.CurrentSession.GetIdentifier(o);
        }

        protected void Delete(object o)
        {
            UnitOfWork.CurrentSession.Delete(o);
        }


        private void InitApplication()
        {
            if (hasBeenInitialized)
                return;

            hasBeenInitialized = true;
            InitSecurity();

            //Generate DB Schema Script            
            new DbSchema().Generate(container);
            //NHibernateProfiler.Initialize();

            //Initilize Rhino Commons basing on the container
            IoC.Initialize(container);
            container.Register(
                Component.For<IEntityInformationExtractor<Dossier>>().ImplementedBy<DossierEntityInformationExtractor>());
        }

        private void InitSecurity()
        {
            //Create container
            container = new WindsorContainer();
            //Register Unit Of Work Facility instance
            container.Kernel.AddFacility("nh", new NHibernateUnitOfWorkFacility());
            //Regiser Rhino Security Facility instance: 
            //1) provide Rhino’s DB table naming convetion: 
            //  Prefix '_'              ex: security_Permissions or 
            //  Schema '.'(is default). ex: security.Permissions
            //2) provide User Type that implements IUser
            container.Kernel.AddFacility("security",
                                         new RhinoSecurityFacility(SecurityTableStructure.Prefix, typeof (User)));
        }

        private void ResolveServices()
        {
            //The repository is main "player" that allows to manage security model            
            authorizationRepository = IoC.Resolve<IAuthorizationRepository>();
            //The service provides authorization information                       
            authorizationService = IoC.Resolve<IAuthorizationService>();
            //Provide a fluent interface that can be used to assign permissions
            permissionsBuilderService = IoC.Resolve<IPermissionsBuilderService>();
            //Allow to retrieve and remove permissions
            //on users, user groups, entities groups and entities.
            permissionService = IoC.Resolve<IPermissionsService>();
        }

        [TearDown]
        public void TearDown()
        {
            CleanUp();

            authorizationRepository.RemoveOperation(manageDossier.Name);
            authorizationRepository.RemoveOperation(viewDossier.Name);
            authorizationRepository.RemoveOperation(allDossierOperations.Name);
            
            authorizationRepository.RemoveUsersGroup(guests.Name);
            authorizationRepository.RemoveUsersGroup(admins.Name);
            UnitOfWork.Current.TransactionalFlush();
            
            authorizationRepository.RemoveUser(user);
            UnitOfWork.Current.TransactionalFlush();
            
            UnitOfWork.CurrentSession.Delete(user);
            UnitOfWork.Current.TransactionalFlush();

            //Stop Rhino Common Unit Of Work Session            
            unitOfWOrk.Dispose();
        }

        protected virtual void CleanUp()
        {
        }
    }
}