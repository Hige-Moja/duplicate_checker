#!/bin/bash

ScriptName=

function f_kill_stuck () {
  PIDsToKill=`ps afux --sort start_time | grep ${ScriptName} | grep -v grep \
    | awk '{print $2}' | head -n -2`
    echo "${PIDsToKill} will be killed."
    kill -9 ${PIDsToKill} 2>&1
    [ $? = 0 ] \
    && echo "Success to kill, continue processing. . ."  \
    || echo "The kill process was not complete successfully, continue processing. . ."
}