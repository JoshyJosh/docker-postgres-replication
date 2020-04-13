#!/bin/bash
pgloop=true

while [ "$pgloop" = true ]
do
    pg_basebackup -h 172.21.0.2 -D /var/lib/postgresql/data -U repuser -vP -w 
    if [ "$?" -ne "0"]; then
        echo "retrying pg_basebackup"
    else
        pgloop=false
    fi
done
    
touch /var/lib/postgresql/data/standby.signal
echo primary_conninfo = \'host=172.21.0.2 port=5432 user=repuser password=testpass application_name=r1\' >> /var/lib/postgresql/data/postgresql.conf
echo primary_slot_name = \'replica_1_slot\' >> /var/lib/postgresql/data/postgresql.conf
echo max_wal_senders = 10 >> /var/lib/postgresql/data/postgresql.conf
echo max_replication_slots = 10 >> /var/lib/postgresql/data/postgresql.conf
postgres
exit 0