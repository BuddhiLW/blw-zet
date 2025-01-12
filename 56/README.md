# Deployment steps, with `Clojure(Script)`

To generate de `Postgres` table, we can access cloud services, like `render` - which let you dig on their services for free (for really small projects, so you can test new technologies and solutions).

You will get a snippet like this, under *PSQL command*:

```bash
PGPASSWORD=<some-password-key> psql -h <host> -U <user> <db-name>
```

Finally, you can dump your `sql` files using the `PSQL shell`.

Also, you can get the `jdbc-url`, using a snippet like this, and the infos given in the platform:

```clj
(ns db
  (:require
   [next.jdbc :as jdbc]
   [next.jdbc.connection]))

(def db-spec {:dbtype "postgres"
              :host "<host>.oregon-postgres.render.com"
              :port "<port>"
              :dbname "<db-name>"
              :user "<user>"
              :password "<password>"})

(next.jdbc.connection/jdbc-url db-spec)
;; => return a `jdbc-url`, you can use to access the db, though your app.
```

Now, you gotta have a server to run the front and back-end, preferably with-in a `docker-container`. 

## TODO(s):
- Explain how to setup the `docker-container`.
- Give examples on launching it in a server.



