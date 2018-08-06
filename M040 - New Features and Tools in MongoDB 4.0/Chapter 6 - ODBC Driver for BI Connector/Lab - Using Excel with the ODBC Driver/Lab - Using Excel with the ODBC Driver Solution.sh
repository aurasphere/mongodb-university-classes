#!/bin/bash

# ============================================================================== #
# MIT License                                                                    #
#                                                                                #
# Copyright (c) 2018 Donato Rimenti                                              #
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
# DESCRIPTION : Solution for MongoDB University M040's Lab 6.                    #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2018 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Creates the directories for the servers.
mkdir -p ~/repl/{1,2,3}

# Starts up the servers.
mongod --dbpath ~/repl/1 --logpath ~/repl/1/log --port 27017 --replSet M040 --bind_ip_all --fork
mongod --dbpath ~/repl/2 --logpath ~/repl/2/log --port 27027 --replSet M040 --bind_ip_all --fork
mongod --dbpath ~/repl/3 --logpath ~/repl/3/log --port 27037 --replSet M040 --bind_ip_all --fork

# Initiates the replicaSet.
mongo --eval 'rs.initiate()'
mongo --eval 'rs.add("m040:27027");rs.add("m040:27037")'

# Imports the lab data.
mongoimport --host M040/$(hostname):27017,$(hostname):27027,$(hostname):27037 -d m040 -c companies < /dataset/companies.json

# Starts the MongoDB Connector for BI.
mongosqld --addr 192.168.40.100 --mongo-uri mongodb://localhost