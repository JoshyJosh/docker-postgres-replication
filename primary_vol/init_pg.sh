#!/bin/bash
pg_ctl init
echo host replication all 172.21.0.3/32 trust >> /var/lib/postgresql/data/pg_hba.conf
pg_ctl start
psql -f /app/add_replication_user.sql
echo wal_level = replica >> /var/lib/postgresql/data/postgresql.conf
echo max_wal_senders = 10 >> /var/lib/postgresql/data/postgresql.conf
echo max_replication_slots = 10 >> /var/lib/postgresql/data/postgresql.conf
echo synchronous_commit = off >> /var/lib/postgresql/data/postgresql.conf
pg_ctl restart
psql -f /app/add_replication_slot.sql
pg_ctl stop
postgres