#!/bin/sh
APP_NAME="SERVICE-SERVER-GATEWAY"
APP_DESC="[ SERVICE-SERVER-GATEWAY ]"


# Process Check
APP_PID=`ps -ef | grep java | grep ${APP_NAME} | grep -v grep | awk '{print $2}'`

if [ -n "$APP_PID" ]
        # Process Already Exist.
        then
                kill -9 $APP_PID
                #echo "======================================================="
                echo " *  Process Stopped! $APP_DESC - PID : "$APP_PID
                #echo "======================================================="
                exit 1
        # Process Not Exist.
        else

                #echo "======================================================="
                echo " *  Already Stopped! No Process - "$APP_DESC
                #echo "======================================================="
fi
