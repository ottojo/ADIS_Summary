# Object-Relational Mapping

Traditionally, relational DBs are accessed using SQL statements.
Drawbacks to this are that SQL is both a different programming model to the
application language and a different data model (relational vs e.g.
variables, object oriented).
This requires mapping between those two domains, and to synchronously
maintain both models, the application code and database.

An idea to solve this is to specify the model only in the application
programming language.
Data entities could be represented by language objects, relationships
by references between objects.
The mapping to the DB data model is automatic.
Database queries/updates are hidden behind read/write of an object
or its properties.
Database inserts are hidden behind object creation.
Executing queries instantiates language objects (queries themselves still
exist).

The database still requires a data model, and schema.
This could however automatically be generated from the data model
definition in the application language, and may even automatically
synchronize changes in the data model.
