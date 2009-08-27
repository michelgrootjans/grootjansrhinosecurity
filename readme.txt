I didn't test the DB script; I've included it only if you want to create the DB schema  
manually instead of using the method from source code (Program.cs):
   //Generate DB Schema Script            
   new DbSchema().Generate(container);
But in general I recommend using NHibernate to generate the DB schema, you just need to create an empty DB and provide a user same as in hibernate.cfg.xml.


