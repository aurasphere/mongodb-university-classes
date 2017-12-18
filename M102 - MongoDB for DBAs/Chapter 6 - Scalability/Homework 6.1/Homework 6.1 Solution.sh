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
# DESCRIPTION : Solution for MongoDB University M102's Homework 6-1.             #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Creates the data directories.
mkdir 1
mkdir 2
mkdir 3

# Starts a server.
start mongod

# Waits for the server.
sleep 5

# Inits the homework.
mongo week6 --eval "load('../chapter_6_scalability/week6__hw6.1_m102_52b491d5e2d4237593ca1d3a.js'); try{ homework.init(); } catch(e){} db.getSiblingDB('admin').shutdownServer();"

# Waits for the servers.
sleep 2

# Starts the servers for the replica set.
mongod --shardsvr --fork
mongod --configsvr --replSet csReplSet --port 27019 --dbpath 1 --fork
mongod --configsvr --replSet csReplSet --port 27020 --dbpath 2 --fork
mongod --configsvr --replSet csReplSet --port 27021 --dbpath 3 --fork

# Waits for the servers.
sleep 5

# Inits the replica set.
mongo --port 27019 --eval "rs.initiate({ _id: 'csReplSet', members:[{ _id : 0, host : 'localhost:27019' }, { _id : 1, host : 'localhost:27020' }, { _id : 2, host : 'localhost:27021' }]});"

# Starts mongos.
mongos --configdb csReplSet/localhost:27019 --fork

# Waits for the servers.
sleep 30

# Adds the shard and prints the solution.
mongo week6 --eval "load('../chapter_6_scalability/week6__hw6.1_m102_52b491d5e2d4237593ca1d3a.js'); sh.addShard('localhost:27018'); print('Solution : ' + homework.a());"