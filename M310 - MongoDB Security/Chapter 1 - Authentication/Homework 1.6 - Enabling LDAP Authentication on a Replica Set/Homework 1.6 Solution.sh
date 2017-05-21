#!/bin/bash

# ============================================================================== #
# MIT License                                                                    #
#                                                                                #
# Copyright (c) 2017 Donato Rimenti                                              #
#                                                                                #
# Permission is hereby granted, free of charge, to any person obtaining a copy   #
# of this software and associated documentation files (the "Software"), to deal  #
# in the Software without restriction, including without limitation the rights   #
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      #
# copies of the Software, and to permit persons to whom the Software is          #
# furnished to do so, subject to the following conditions:                       #
#                                                                                #
# The above copyright notice and this permission notice shall be included in     #
# all copies or substantial portions of the Software.                            #
#                                                                                #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     #
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    #
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  #
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  #
# SOFTWARE.                                                                      #
# ============================================================================== #
#                                                                                #
# DESCRIPTION : Solution for MongoDB University M310's Homework 1.6.             #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Kills all the mongo process and waits for them to exit.
pkill mongod
sleep 3

# Sets up some variables.
course="M310"
exercise="HW-1.6"
workingDir="$HOME/${course}-${exercise}"
dbDir="$workingDir/db"
logName="mongodb.log"
ports=(31160 31161 31162)
replSetName="TO_BE_SECURED"
initiateStr="rs.initiate({
                 _id: '$replSetName',
                 members: [
                  { _id: 1, host: 'database.m310.mongodb.university:31160', priority: 1 },
                  { _id: 2, host: 'database.m310.mongodb.university:31161' },
                  { _id: 3, host: 'database.m310.mongodb.university:31162' }
                 ]
                })"

# Creates the working directories.
mkdir -p "$workingDir/"{r0,r1,r2}

# Launch the mongo instances with no authentication to create the first user.
for ((i=0; i < ${#ports[@]}; i++))
do
  mongod --dbpath "$workingDir/r$i" --logpath "$workingDir/r$i/$logName.log" --port ${ports[$i]} --replSet $replSetName --fork
done

# Waits for the mongo servers to fully come up.
sleep 3

# Initializes the replica set.
mongo --port ${ports[0]} --eval "$initiateStr"
sleep 10

# Creates the user adam with LDAP.
printf 'use $external\ndb.createUser({user: "adam", roles:["root"]})' |  mongo --port ${ports[0]} 

# Restarts the mongo servers with the LDAP configuration.
mongo admin --port 31160 --eval "db.shutdownServer()"
mongo admin --port 31161 --eval "db.shutdownServer()"
mongo admin --port 31162 --eval "db.shutdownServer()"

for ((i=0; i < ${#ports[@]}; i++))
do
  mongod --dbpath "$workingDir/r$i" --logpath "$workingDir/r$i/$logName.log" --port ${ports[$i]} --replSet $replSetName --fork --auth --setParameter authenticationMechanisms=PLAIN --setParameter saslauthdPath="/var/run/saslauthd/mux"
done

# Validates the homework.
./validate-hw-1.6.sh