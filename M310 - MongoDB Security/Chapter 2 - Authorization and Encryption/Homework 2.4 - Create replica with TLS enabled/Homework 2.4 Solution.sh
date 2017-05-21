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
# DESCRIPTION : Solution for MongoDB University M310's Homework 2.4.             #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Kills all the mongo process and waits for them to exit.
pkill mongod
sleep 3

# Creates the directory structure.
mkdir -p ~/M310-HW-2.4/r0
mkdir -p ~/M310-HW-2.4/r1
mkdir -p ~/M310-HW-2.4/r2

# Starts the mongo instances.
mongod --port 31240 --dbpath ~/M310-HW-2.4/r0 --logpath ~/M310-HW-2.4/r0/mongo.log --fork --sslMode requireSSL --replSet HW-2.4 --sslCAFile ~/shared/certs/ca.pem --sslPEMKeyFile ~/shared/certs/server.pem
mongod --port 31241 --dbpath ~/M310-HW-2.4/r1 --logpath ~/M310-HW-2.4/r1/mongo.log --fork --sslMode requireSSL --replSet HW-2.4 --sslCAFile ~/shared/certs/ca.pem --sslPEMKeyFile ~/shared/certs/server.pem
mongod --port 31242 --dbpath ~/M310-HW-2.4/r2 --logpath ~/M310-HW-2.4/r2/mongo.log --fork --sslMode requireSSL --replSet HW-2.4 --sslCAFile ~/shared/certs/ca.pem --sslPEMKeyFile ~/shared/certs/server.pem

# Initiates the replica set.
mongo --port 31240 --host database.m310.mongodb.university --ssl --sslPEMKeyFile ~/shared/certs/client.pem --sslCAFile ~/shared/certs/ca.pem --eval 'rs.initiate({
        "_id" : "HW-2.4",
        "members" : [
    {
      "_id" : 0,
      "host" : "database.m310.mongodb.university:31240"
    },
    {
      "_id" : 1,
      "host" : "database.m310.mongodb.university:31241"
    },
    {
      "_id" : 2,
      "host" : "database.m310.mongodb.university:31242"
    }
  ]
}
)'

# Validates the homework.
./validate-hw-2.4.sh