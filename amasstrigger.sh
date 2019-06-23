#!/bin/bash -
#===============================================================================
#amasstrigger v0.1 - Copyright 2019 James Slaughter,
#This file is part of amasstrigger v0.1.

#amasstrigger v0.1 is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#amasstrigger v0.1 is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with dgaioc v0.1.  If not, see <http://www.gnu.org/licenses/>.
#===============================================================================
#------------------------------------------------------------------------------
#
# Execute amasstrigger on top of an Ubuntu-based Linux distribution.
#
#------------------------------------------------------------------------------

__ScriptVersion="amasstrigger-v0.1"
LOGFILE="/home/tools/amasstrigger.log"
ARG1=$1
ARG2=$2

echoerror() {
    printf "${RC} [x] ${EC}: $@\n" 1>&2;
}

echoinfo() {
    printf "${GC} [*] ${EC}: %s\n" "$@";
}

echowarn() {
    printf "${YC} [-] ${EC}: %s\n" "$@";
}

usage() {
    echo "usage: amasstrigger.sh <domain> <output>"
    exit 1
}

initialize() {
  echoinfo "--------------------------------------------------------------------------------" >> $LOGFILE
  echoinfo "Running amasstrigger.sh version $__ScriptVersion on `date`" >> $LOGFILE
  echoinfo "--------------------------------------------------------------------------------" >> $LOGFILE

  echoinfo "---------------------------------------------------------------"
  echoinfo "Running amasstrigger.sh version $__ScriptVersion on `date`"
  echoinfo "---------------------------------------------------------------"
}

pipe_to_amass() {
 
  #Execute Amass with the following params
  echoinfo "Target domain is: '$ARG1'" 
  echoinfo "Piping program execution to Amass..."
  echoinfo "Piping program execution to Amass..." >> $LOGFILE

  echo $(snap run amass enum -active -d $ARG1 -o $ARG2) >> $LOGFILE


  return 0
}

wrap_up() {
  echoinfo "--------------------------------------------------------------------------------" >> $LOGFILE
  echoinfo "Program complete on `date`" >> $LOGFILE
  echoinfo "--------------------------------------------------------------------------------" >> $LOGFILE

  echoinfo "---------------------------------------------------------------"
  echoinfo "Program complete on `date`"
  echoinfo "---------------------------------------------------------------"
}

#Function calls
initialize
if [ ! -z "$1" ] || [ ! -z "$2" ]
then
  pipe_to_amass
else
  usage
fi
wrap_up
