###### optimize_mythdb.sh
#!/bin/sh

OPT_MYTHDB='/var/lib/mythtv/mythtv/mythtv/contrib/maintenance/optimize_mythdb.pl'
#OPT_MYTHDB='/usr/share/doc/mythtv-backend/contrib/maintenance/optimize_mythdb.pl'

LOG='/var/log/mythtv/optimize_mythdb.log'

echo "Started ${OPT_MYTHDB} on `date`" >> ${LOG}
${OPT_MYTHDB} >> ${LOG}
echo "Finished ${OPT_MYTHDB} on `date`" >> ${LOG} 

