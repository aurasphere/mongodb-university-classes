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
# DESCRIPTION : Solution for MongoDB University M102's Homework 4-4.             #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Creates the data dirs.
mkdir 1
mkdir 2
mkdir 3

# Starts a server.
mongod --dbpath 1 --fork

# Waits for the server.
sleep 5

# Inits the DB and shuts it down.
mongo admin --eval "load('../chapter_4_replication/replication.js'); homework.init(); db.shutdownServer(); quit();"

# Starts the replica set.
mongod --port 27001 --dbpath 1 --replSet replSet --fork
mongod --port 27002 --dbpath 2 --replSet replSet --fork
mongod --port 27003 --dbpath 3 --replSet replSet --fork

# Waits for the server.
sleep 5

# Prints the solution.
mongo replication --port 27001 --eval "load('../chapter_4_replication/replication.js'); rs.initiate({ _id: 'replSet', members:[{ _id : 0, host :'localhost:27001'}, { _id : 1, host : 'localhost:27002'}, { _id : 2, host : 'localhost:27003'}]}); sleep(20000); rs.stepDown();"

# Prints the solution.
mongo replication --port 27002 --eval "load('../chapter_4_replication/replication.js'); rs.reconfig({ _id : 'replSet', members:[{ _id : 1, host : 'localhost:27002'}, { _id : 2, host : 'localhost:27003'}]}, {force : true}); sleep(20000); print('Solution : ' + homework.d());"