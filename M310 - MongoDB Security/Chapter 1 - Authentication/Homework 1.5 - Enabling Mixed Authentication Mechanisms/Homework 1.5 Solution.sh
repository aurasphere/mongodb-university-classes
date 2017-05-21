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
# DESCRIPTION : Solution for MongoDB University M310's Homework 1.5.             #
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
exercise="HW-1.5"
workingDir="$HOME/${course}-${exercise}"
dbDir="$workingDir/db"
logName="mongodb.log"
ports=(31150 31151 31152)
replSetName="TO_BE_SECURED"
initiateStr="rs.initiate({
                 _id: '$replSetName',
                 members: [
                  { _id: 1, host: 'database.m310.mongodb.university:31150', priority: 1 },
                  { _id: 2, host: 'database.m310.mongodb.university:31151' },
                  { _id: 3, host: 'database.m310.mongodb.university:31152' }
                 ]
                })"

# Generates the keyfile on the home folder because you can't change permission on
# the shared one.
openssl rand -base64 756 > $HOME/keyfile
chmod 400 $HOME/keyfile

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

# Creates the user will with password $uperAdmin.
mongo admin --port ${ports[0]} --eval 'db.createUser({user: "will", pwd: "$uperAdmin", roles: ["root"]})'

# Restarts the mongo servers with the keyfile configuration.
mongo admin --port 31150 --eval "db.shutdownServer()"
mongo admin --port 31151 --eval "db.shutdownServer()"
mongo admin --port 31152 --eval "db.shutdownServer()"

for ((i=0; i < ${#ports[@]}; i++))
do
  mongod --dbpath "$workingDir/r$i" --logpath "$workingDir/r$i/$logName.log" --port ${ports[$i]} --replSet $replSetName --fork --keyFile $HOME/keyfile --sslMode requireSSL --clusterAuthMode x509 --sslPEMKeyFile "certs/server.pem" --sslCAFile "certs/ca.pem"
done

# Waits for the mongo servers to fully come up.
sleep 10

# Creates the user for the certificate.
printf 'use admin\ndb.auth("will","$uperAdmin")\nuse $external\ndb.createUser({user: "C=US,ST=New York,L=New York City,O=MongoDB,OU=University2,CN=M310 Client", roles:[{ role: "userAdminAnyDatabase", db: "admin" }]})' | mongo --host database.m310.mongodb.university --sslPEMKeyFile "certs/client.pem" --sslCAFile "certs/ca.pem" --ssl --port ${ports[0]}

# Validates the homework.
./validate-hw-1.5.sh