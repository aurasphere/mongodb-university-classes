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
# DESCRIPTION : Solution for MongoDB University M310's Homework 2.1.             #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Kills all the mongo process and waits for them to exit.
pkill mongod
sleep 3

# Creates the directory structure.
mkdir -p ~/M310-HW-2.1/r0
mkdir -p ~/M310-HW-2.1/r1
mkdir -p ~/M310-HW-2.1/r2

# Generates the keyfile on the home folder because you can't change permission on
# the shared one.
openssl rand -base64 755 > ~/M310-HW-2.1/keyfile
chmod 400 ~/M310-HW-2.1/keyfile

# Starts the mongo instances.
mongod --dbpath ~/M310-HW-2.1/r0 --logpath ~/M310-HW-2.1/r0/mongo.log --port 31210 --fork --auth --keyFile ~/M310-HW-2.1/keyfile --replSet HW-2.1
mongod --dbpath ~/M310-HW-2.1/r1 --logpath ~/M310-HW-2.1/r1/mongo.log --port 31211 --fork --auth --keyFile ~/M310-HW-2.1/keyfile --replSet HW-2.1
mongod --dbpath ~/M310-HW-2.1/r2 --logpath ~/M310-HW-2.1/r2/mongo.log --port 31212 --fork --auth --keyFile ~/M310-HW-2.1/keyfile --replSet HW-2.1

# Initiates the replica set.
mongo admin --port 31210 --eval "rs.initiate()"
sleep 3

# Creates the users.
mongo admin --port 31210 --eval 'db.createUser({user: "userAdmin", pwd: "badges", roles: [{ role:"userAdminAnyDatabase", db: "admin" }]})'
mongo admin --port 31210 --username "userAdmin" --password "badges" --eval 'db.createUser({user: "sysAdmin", pwd: "cables", roles: [{ role:"clusterManager", db: "admin" }]})'
mongo admin --port 31210 --username "userAdmin" --password "badges" --eval 'db.createUser({user: "dbAdmin", pwd: "collections", roles: [{ role:"dbAdminAnyDatabase", db: "admin" }]})'
mongo admin --port 31210 --username "userAdmin" --password "badges" --eval 'db.createUser({user: "dataLoader", pwd: "dumpin", roles: [{ role:"readWriteAnyDatabase", db: "admin" }]})'

# Adds the other members to the replica set with the new user.
mongo admin --port 31210 --username "sysAdmin" --password "cables" --eval 'rs.add("database.m310.mongodb.university:31211")'
mongo admin --port 31210 --username "sysAdmin" --password "cables" --eval 'rs.add("database.m310.mongodb.university:31212")'

# Validates the homework.
./validate-hw-2.1.sh