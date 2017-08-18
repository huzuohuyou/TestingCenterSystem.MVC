using System.Data.Entity;
using System.Data.Entity.Core.EntityClient;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using TestingCenterSystem.Models.CDR;

namespace TestingCenter.Models
{
    public class CDRContext : CDREntities
    {
        public CDRContext(EntityConnection existingConnection, bool contextOwnsConnection): base(existingConnection, contextOwnsConnection)
        {

        }
        public override int SaveChanges()
        {
            try
            {
                return base.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                var newException = new FormattedDbEntityValidationException(e);
                throw newException;
            }
            catch (DbUpdateException e)
            {
                throw e;
            }
        }
    }

   
}
