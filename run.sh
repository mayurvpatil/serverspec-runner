#!/bin/sh 
set -xv

bundle install &&
#inspec vendor --overwrite

if [ "$SPEC_OS" = "windows" ]
then
    if [ -n $SPEC_PASS ]
    then
        echo "Windows call with password"
        if [ -n $SPEC_PORT ]
            then PORT=${SPEC_PORT}
        else
            PORT=5985
        fi
        echo ${SPEC_OS}
        echo $(printf "%s" ${SPEC_PASS})
        echo ${PORT}
        echo ${SPEC_HOST_NAME} 
        echo ${SPEC_USER}
        inspec exec  controls/windows_spec.rb -b "winrm" --host ${SPEC_HOST_NAME} --port $PORT --user "${SPEC_USER}" --password $(printf "%s" ${SPEC_PASS}) --ssl --self-signed  --format html >> report/result.html
        inspec exec  controls/windows_spec.rb -b "winrm" --host ${SPEC_HOST_NAME} --port $PORT --user "${SPEC_USER}" --password $(printf "%s" ${SPEC_PASS}) --ssl --self-signed  --format json-rspec >> report/result.json
    else 
        echo "Windows call with key."
    fi
elif [ "$SPEC_OS" = "linux" ]
then


fi

export SPEC_OS=windows
export SPEC_PASS='(b=pnlMGU!MUbepR(hoHStUh8L;Fcs&R'
export SPEC_PORT=5986
export SPEC_HOST_NAME=34.204.75.248  
export SPEC_USER=Administrator