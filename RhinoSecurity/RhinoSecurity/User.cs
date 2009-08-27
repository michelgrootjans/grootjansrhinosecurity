using Rhino.Security;

namespace RhinoSecurity
{
    public class User : IUser
    {
        public virtual int Id { get; set; }

        public virtual string Name { get; set; }

        /// <summary>
        /// Gets or sets the security info for this user
        /// </summary>
        /// <value>The security info.</value>
        public virtual SecurityInfo SecurityInfo
        {
            get { return new SecurityInfo(Name, Id); }
        }
    }
}