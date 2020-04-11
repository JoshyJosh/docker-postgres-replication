# NOTES:

As of postgres 12 recovery.conf has been substituted for standby.signal and standby.
Current replica setup is set for asynchronous replication

postgresql.conf snapshots are on postgres-confs folder

postgresql.conf.example is the default generated  postgresql.conf

THIS IS A TEST SETUP, due to the lack of `.pgpass` password recognition in this setup, there is a lack of an additional layer of security. More reasearch is needed as to why this occurs

# Setup:
Copy or modify `.pg_env.example` to `.pg_env`

# TODO:

Need to automate initial call for replications.

- automate replication call for `rm -rf /var/lib/postgresql/data` and `pg_basebackup -h <PRIMARY_IP> -D <DATA_DIRECTORY> -U repuser -vP -W` and `touch standby.signal` in data folder.
- Consider use of `.pgpass` (SUBNOTE: could not get `.pgpass` method to work, pg_basebackup recognizes file location but ignores password entry. Could be due to password encryption)
- add env to toggle synchronous and asynchronous
- create replica swarm
- deal with `specified neither primary_conninfo nor restore_command` warning

# Sources:

- https://docs.timescale.com/latest/tutorials/replication#replication-modes
- https://www.2ndquadrant.com/en/blog/replication-configuration-changes-in-postgresql-12/