#!/bin/bash
currDir=`pwd`
currDir=`basename $currDir`
tarName=${currDir}.tgz
(cd ..; tar cvzf ${tarName} ./${currDir}) 
exit $?
