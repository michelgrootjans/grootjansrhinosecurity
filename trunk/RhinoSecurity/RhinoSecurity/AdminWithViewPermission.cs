using NUnit.Framework;

namespace RhinoSecurity
{
    public class AdminWithViewPermission : SecurityTest
    {
        protected override void PrepareData()
        {
            permissionsBuilderService
                .Allow(viewDossier)
                .For(admins)
                .OnEverything()
                .DefaultLevel()
                .Save();
            authorizationRepository.AssociateUserWith(user, admins);
        }

        [Test]
        public void IsAllowedToViewContent()
        {
            Assert.IsTrue(authorizationService.IsAllowed(user, "/Dossier/View"));
        }

        [Test]
        public void IsNotAllowedToManageContent()
        {
            Assert.IsFalse(authorizationService.IsAllowed(user, "/Dossier/Manage"));
        }

        [Test]
        public void ShouldExplainPermissions()
        {
            var authorizationInformation = authorizationService.GetAuthorizationInformation(user, "/Dossier/View");
            var message =
                "Permission (level 1) for operation '/Dossier/View' was granted to group 'admins' on 'everything' ('George W.' is a member of 'admins')\r\n";
            Assert.AreEqual(message, authorizationInformation.ToString());
        }
    }
}