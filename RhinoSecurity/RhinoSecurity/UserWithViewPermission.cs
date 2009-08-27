using NUnit.Framework;

namespace RhinoSecurity
{
    public class UserWithViewPermission : SecurityTest
    {
        protected override void PrepareData()
        {
            permissionsBuilderService
                .Allow("/Dossier/View")
                .For(user)
                .OnEverything()
                .DefaultLevel()
                .Save();
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
                "Permission (level 1) for operation '/Dossier/View' was granted to 'George W.' on 'everything'\r\n";
            Assert.AreEqual(message, authorizationInformation.ToString());
        }
    }
}