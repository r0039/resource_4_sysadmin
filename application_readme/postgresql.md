#### How to see active connections and “current activity” in PostgreSQL 8.4. 
```
select *
from pg_stat_activity
where datname = 'mydatabasename';
```
