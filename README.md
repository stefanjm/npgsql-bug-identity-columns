# npgsql-bug-identity-columns
A Repository for Npgsql Core identity generation possible bug.

.NET Core **2.2**, Entity Framework Core **2.2**

Repository for Npgsql issue: [#739](https://github.com/npgsql/Npgsql.EntityFrameworkCore.PostgreSQL/issues/739)

# RESOLVED 

Wasn't a bug but something that isn't yet implemented (might never be). What I was trying to do is switch from SQL Server to PostgreSQL (Npgsql) while on the same Migration, only change being adding `ForNpgsqlUseIdentityColumns()` to  `OnCreateModel` . That caused Npgsql to not apply the identity changes after switching to PostgreSQL because there were no actual changes to the Entity model. 

# The right way to do it (as of now)
Microsoft has the perfect documentation for how to handle multiple providers: [Migrations with Multiple Providers](https://docs.microsoft.com/en-us/ef/core/managing-schemas/migrations/providers).
