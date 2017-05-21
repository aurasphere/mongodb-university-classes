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
# DESCRIPTION : Solution for MongoDB University M310's Homework 2.2.             #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Kills all the mongo process and waits for them to exit.
pkill mongod
sleep 3

# Creates the directory structure.
mkdir -p ~/M310-HW-2.2/r0
mkdir -p ~/M310-HW-2.2/r1
mkdir -p ~/M310-HW-2.2/r2

# Generates the keyfile on the home folder because you can't change permission on
# the shared one.
openssl rand -base64 755 > ~/M310-HW-2.2/keyfile
chmod 400 ~/M310-HW-2.2/keyfile

# Starts the mongo instances.
mongod --dbpath ~/M310-HW-2.2/r0 --logpath ~/M310-HW-2.2/r0/mongo.log --port 31220 --fork --auth --keyFile ~/M310-HW-2.2/keyfile --replSet HW-2.2
mongod --dbpath ~/M310-HW-2.2/r1 --logpath ~/M310-HW-2.2/r1/mongo.log --port 31221 --fork --auth --keyFile ~/M310-HW-2.2/keyfile --replSet HW-2.2
mongod --dbpath ~/M310-HW-2.2/r2 --logpath ~/M310-HW-2.2/r2/mongo.log --port 31222 --fork --auth --keyFile ~/M310-HW-2.2/keyfile --replSet HW-2.2

# Initiates the replica set.
mongo admin --port 31220 --eval "rs.initiate()"
sleep 3

# Creates the users.
mongo admin --port 31220 --eval 'db.createUser({user: "admin", pwd: "webscale", roles: [{ role:"root", db: "admin" }]})'
mongo admin --port 31220 --username "admin" --password "webscale" --eval 'db.createUser({user: "reader", pwd: "books", roles: [{ role:"read", db: "acme" }]})'
mongo admin --port 31220 --username "admin" --password "webscale" --eval 'db.createUser({user: "writer", pwd: "typewriter", roles: [{ role:"readWrite", db: "acme" }]})'

# Adds the other members to the replica set with the new user.
mongo admin --port 31220 --username "admin" --password "webscale" --eval 'rs.add("database.m310.mongodb.university:31221")'
mongo admin --port 31220 --username "admin" --password "webscale" --eval 'rs.add("database.m310.mongodb.university:31222")'

# Validates the homework.
./validate-hw-2.2.sh