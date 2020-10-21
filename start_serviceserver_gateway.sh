#!/bin/sh

APP_NAME="SERVICE-SERVER-GATEWAY"
APP_DESC="[ SERVICE-SERVER-GATEWAY ]"

# Process Check
APP_PID=`ps -ef | grep java | grep ${APP_NAME} | grep -v grep | awk '{print $2}'`

if [ -n "$APP_PID" ]
        # Process Already Exist.
        then
                echo "======================================================="
                echo " *  Already Running! $APP_DESC - PID : "$APP_PID
                echo "======================================================="
                exit 1
        # Process Not Exist.
        else

#                JAVA_HOME=/svc/env/jdk1.8.0_91
		JAVA_HOME=/usr
                JAVA_OPTS="-D$APP_NAME -Xms4096m -Xmx4096m -XX:MaxPermSize=128m -XX:NewSize=1G"

                LIB_HOME=/svc/app/serviceServer/

	CLASSPATH=${LIB_HOME}/service-server-0.0.1-SNAPSHOT.jar
#        CLASSPATH=${LIB_HOME}/service-server.jar


        echo "======================================================="
        echo " *  Process Running! " $APP_DESC
        echo "======================================================="

       nohup ${JAVA_HOME}/bin/java -jar -Dspring.profiles.active=dev -Dspring.config.location=${LIB_HOME}/application.yml ${JAVA_OPTS} $CLASSPATH > /dev/null 2>&1 &

fi


