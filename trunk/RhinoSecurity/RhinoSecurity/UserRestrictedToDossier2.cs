using System;
using NUnit.Framework;
using Rhino.Commons;

namespace RhinoSecurity
{
    public class UserRestrictedToDossier2 : SecurityTest
    {
        private Dossier dossier1;
        private Dossier dossier2;
        private Dossier dossier3;

        protected override void PrepareData()
        {
            dossier1 = new Dossier("dossier 1");
            dossier2 = new Dossier("dossier 2");
            dossier3 = new Dossier("dossier 3");
            Save(dossier1);
            Save(dossier2);
            Save(dossier3);

            authorizationRepository.CreateEntitiesGroup("dossiers");
            UnitOfWork.Current.TransactionalFlush();
            authorizationRepository.AssociateEntityWith(dossier1, "dossiers");
            UnitOfWork.Current.TransactionalFlush();
            authorizationRepository.AssociateEntityWith(dossier2, "dossiers");
            UnitOfWork.Current.TransactionalFlush();
            authorizationRepository.AssociateEntityWith(dossier3, "dossiers");
            UnitOfWork.Current.TransactionalFlush();

            permissionsBuilderService
                .Allow(allDossierOperations)
                .For(user)
                .On(dossier1)
                .DefaultLevel()
                .Save();
        }

        protected override void CleanUp()
        {
            var dossiers = session.CreateCriteria(typeof (Dossier)).List();
            foreach (var dossier in dossiers)
            {
                session.Delete(dossier);
            }
            authorizationRepository.RemoveEntitiesGroup("dossiers");
        }

        [Test]
        public void CanViewDossier1()
        {
            Assert.IsTrue(authorizationService.IsAllowed(user, dossier1, "/Dossier/View"));
        }

        [Test]
        public void CanNOTViewDossier2()
        {
            Assert.IsFalse(authorizationService.IsAllowed(user, dossier2, "/Dossier/View"));
        }

        [Test]
        public void CanNOTViewDossier3()
        {
            Assert.IsFalse(authorizationService.IsAllowed(user, dossier3, "/Dossier/View"));
        }


        [Test]
        public void ShouldExplainPermissions()
        {
            var authorizationInformation = authorizationService.GetAuthorizationInformation(user, dossier1, "/Dossier/View");
            Console.WriteLine(authorizationInformation.ToString());
            var message =
                "Permission (level 1) for operation '/Dossier/View' was granted to group 'admins' on 'everything' ('George W.' is a member of 'admins')\r\n";
            Assert.AreEqual(message, authorizationInformation.ToString());
        }

        [Test]
        public void CanOnlyGetDossier1()
        {
            var criteria = UnitOfWork.CurrentSession.CreateCriteria(typeof (Dossier), "dossier");
            authorizationService.AddPermissionsToQuery(user, "/Dossier/View", criteria);
            var dossiers = criteria.List();
            Assert.AreEqual(1, dossiers.Count);
        }
    }
}