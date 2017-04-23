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
#																				 #
# DESCRIPTION : Solution for MongoDB University M202's Homework 4-1.             #
# AUTHOR : Donato Rimenti														 #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti									 #
# LICENSE : MIT																	 #
#																				 #
# ============================================================================== #

# Kills all the mongo process.
pkill mongod
pkill mongos

# Creates the directory structure.
mkdir {shard{0,1,2}-,config-}{0,1,2}

# Starts the mongod and mongos process.
mongod --shardsvr --port 27001 --dbpath shard0-0 --logpath shard0-0/shard0-0.log --smallfiles --fork
mongod --shardsvr --port 27002 --dbpath shard1-0 --logpath shard1-0/shard1-0.log --smallfiles --fork
mongod --shardsvr --port 27003 --dbpath shard2-0 --logpath shard2-0/shard2-0.log --smallfiles --fork

mongod --shardsvr --port 28001 --dbpath config-0 --logpath config-0/config-0.log --smallfiles --fork
mongod --shardsvr --port 28002 --dbpath config-1 --logpath config-1/config-1.log --smallfiles --fork
mongod --shardsvr --port 28003 --dbpath config-2 --logpath config-2/config-2.log --smallfiles --fork

mongos --port 29000 --configdb localhost:28001, localhost:28002, localhost:28003 --fork

# Performs the assignment.
mongo --port 29000 "Homework 4.1 Solution Part 2.js"