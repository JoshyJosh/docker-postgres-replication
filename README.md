# NOTES:

As of postgres 12 recovery.conf has been substituted for standby.signal and standby.
Current replica setup is set for asynchronous replication

postgres.conf snapshots are on postgres-confs folder

# TODO:

Need to automate initial call for replications.

- automate replication call for `rm -rf /var/lib/postgresql/data` and `pg_basebackup -h <PRIMARY_IP> -D <DATA_DIRECTORY> -U repuser -vP -W` and `touch standby_signal` in data folder.
- Consider use of pgpass
- add env to toggle synchronous and asynchronous

# Sources

- https://docs.timescale.com/latest/tutorials/replication#replication-modes
- https://www.2ndquadrant.com/en/blog/replication-configuration-changes-in-postgresql-12/