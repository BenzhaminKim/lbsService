daily=`date +'%Y%m%d'`
logfile="/svc/app/serviceServer/log_db_backup_"$daily".txt"

echo `date` " === hourly backup start" >> $logfile

filename="/svc/app/serviceServer/tb_raw_data_$daily"

/svc/app/serviceServer/select_tb.exp $filename'.csv'
echo `date` " === hourly backup end" >> $logfile

