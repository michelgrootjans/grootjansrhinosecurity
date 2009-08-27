using System;
using System.Collections.Generic;
using Castle.Windsor;
using Rhino.Commons;
using Rhino.Commons.Facilities;
using Rhino.Security;
using Rhino.Security.Interfaces;
using Rhino.Security.Model;

namespace RhinoSecurity
{
    internal class Program
    {
        private static IAuthorizationRepository authorizationRepository;
        private static IPermissionsBuilderService permissionsBuilderService;
        private static IPermissionsService permissionService;
        private static IAuthorizationService authorizationService;
        private static IWindsorContainer container;

        private static void Main(string[] args)
        {
            InitRhinoSecurity();

            //Generate DB Schema Script            
            new DbSchema().Generate(container);

            //Initilize Rhino Commons basing on the container
            IoC.Initialize(container);
            ResolveRhinoServices();            

            //Start Rhino Common Unit Of Work Session            
            using (UnitOfWork.Start())
            {               
                //Create a User
                var userArt = new User { Name = ("ArturTrosin") };
                UnitOfWork.CurrentSession.Save(userArt);
                //Create "AdminUserGroup" UsersGroup                  
                authorizationRepository.CreateUsersGroup("AdminUserGroup");
                UnitOfWork.Current.TransactionalFlush();
                //Create Child group for "AdminUserGroup"
                authorizationRepository.CreateChildUserGroupOf("AdminUserGroup", "GuestUserGroup");

                //Create two operations: root /Dossier          operation 
                //              and its child /Dossier/Manage   operation
                authorizationRepository.CreateOperation("/Dossier/Manage");
                UnitOfWork.Current.TransactionalFlush();
                //Create third operation as child of the /Dossier
                authorizationRepository.CreateOperation("/Dossier/View");
                UnitOfWork.Current.TransactionalFlush();

                //add user to "AdminUserGroup", so all further permissions for "AdminUserGroup"
                //group are aslo applied for the user also               
                authorizationRepository.AssociateUserWith(userArt, "AdminUserGroup");               
                UnitOfWork.Current.TransactionalFlush();


                //Create Permission using Builder Pattern 
                //and its fluent interface:               
                permissionsBuilderService
                  //Allow "/Dossier" Operation 
                  .Allow("/Dossier")
                  //for "AdminUserGroup"
                  .For("AdminUserGroup")
                  //Could be specified On an entityGroup 
                  //or an entity that implemented IEntityInformationExtractor  
                  .OnEverything() 
                  //Here could be specified Permission priority Level
                  //DefaultLevel is equal with 1
                  .DefaultLevel()
                  .Save();
                UnitOfWork.Current.TransactionalFlush();

                //Create Deny permission for user with level 5    
                permissionsBuilderService
                  .Deny("/Dossier/View")                  
                  .For(userArt)                 
                  .OnEverything()                  
                  .Level(5)
                  .Save();
                UnitOfWork.Current.TransactionalFlush();

                //Ask users allowance for an Operation
                bool isAllowedContentOp = authorizationService.IsAllowed(userArt, "/Dossier");
                bool isAllowedContentManageOp = authorizationService.IsAllowed(userArt, "/Dossier/Manage");

                Console.WriteLine("Has access to /Dossier: {0}", isAllowedContentOp);
                Console.WriteLine("Has access to /Dossier/Manage: {0}", isAllowedContentManageOp);

                //Retrieve Rhino Security entities  
                UsersGroup adminUsersGroupWithoutUser = authorizationRepository.GetUsersGroupByName("AdminUserGroup");
                Operation contentViewOp = authorizationRepository.GetOperationByName("/Dossier/View");
                var userArtPermission = new List<Permission>(permissionService.GetPermissionsFor(userArt));

                Console.WriteLine("Returned UsersGroup: {0}", adminUsersGroupWithoutUser.Name);
                Console.WriteLine("Returned Operation: {0}", contentViewOp.Name);
                userArtPermission.ForEach(p => Console.WriteLine(p.Operation));
                //Console.WriteLine("Returned first Permission UsersGroup: {0}", userArtPermission[0].UsersGroup.Name);

                //Retrieve athorization info that can help to 
                //understand reason of allowance (or not) of an operation
                //its very helpful for debuging
                AuthorizationInformation authInfo = authorizationService
                                                                   .GetAuthorizationInformation(userArt, "/Dossier");

                Console.WriteLine("Get Athorization Info: {0}", authInfo);

                //Cleanup created entities
                authorizationRepository.RemoveOperation("/Dossier/Manage");
                authorizationRepository.RemoveOperation("/Dossier/View");
                authorizationRepository.RemoveOperation("/Dossier");
                //Remove child group first
                authorizationRepository.RemoveUsersGroup("GuestUserGroup");  
                authorizationRepository.RemoveUsersGroup("AdminUserGroup");               
                UnitOfWork.Current.TransactionalFlush();
                authorizationRepository.RemoveUser(userArt);                
                UnitOfWork.Current.TransactionalFlush();
                UnitOfWork.CurrentSession.Delete(userArt);                
                UnitOfWork.Current.TransactionalFlush();            
            }
        }
       
        private static void InitRhinoSecurity()
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

        private static void ResolveRhinoServices()
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
    }   
}