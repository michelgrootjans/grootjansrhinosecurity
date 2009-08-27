using NUnit.Framework;

namespace RhinoSecurity
{
    public class GuestWithoutPermissions : SecurityTest
    {
        protected override void PrepareData()
        {
            authorizationRepository.AssociateUserWith(user, guests);
        }

        [Test]
        public void IsNotAllowedToViewContent()
        {
            Assert.IsFalse(authorizationService.IsAllowed(user, "/Dossier/View"));
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
                "Permission for operation '/Dossier/View' was not granted to user 'George W.' or to the groups 'George W.' is associated with ('admins, guests')\r\n";
            Assert.AreEqual(message, authorizationInformation.ToString());
        }
    }
}