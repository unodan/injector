#!/bin/bash
################################################################################
#
#	Filename: functions.sh
#
#	Author: Daniel Huckson  
#	Version 1.0                     
#	Date: 2011/09/06
#	Purpose:
#
################################################################################
#
source $CONFIG

do_query() {

        config=".my.cnf.$$"
        command=".mysql.$$"
        touch $config $command
        chmod 600 $config $command

        cat > "$config" << EOF
[mysql]
user=$db_adm
password='$db_adm_pwd'
EOF

        echo "$1" > $command
        mysql --defaults-file=$config < $command > /dev/null
        rval=$?
        rm -f $config $command

        return $rval
}