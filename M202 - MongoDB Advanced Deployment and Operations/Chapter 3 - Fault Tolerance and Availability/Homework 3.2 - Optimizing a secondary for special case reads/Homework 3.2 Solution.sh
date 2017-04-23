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
# DESCRIPTION : Solution for MongoDB University M202's Homework 3-2.             #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Starts the replica set.
sh ../chapter_3_fault_tolerance_and_availability.fd5fb9031bd7/spin-up-three-member-replica-set.sh

# Connects to the secondary on port 27018 and shuts it down.
printf "use admin\n db.shutdownServer()" | mongo --port 27018

# Restarts the secondary without --replSet and on a different port.
mongod --dbpath ../three-member-replica-set/2 --logpath ../three-member-replica-set/2/mongod.log --smallfiles --noprealloc --port 28018 --fork

# Connects to the secondary, creates the index and shuts the server down again.
printf "use testDB\n db.testColl.createIndex({a : 1})\n use admin\n db.shutdownServer()" | mongo --port 28018

# Reinserts the secondary into the replica set.
mongod --dbpath ../three-member-replica-set/2 --logpath ../three-member-replica-set/2/mongod.log --smallfiles --noprealloc --port 27018 --replSet threeMemberReplicaSet --fork