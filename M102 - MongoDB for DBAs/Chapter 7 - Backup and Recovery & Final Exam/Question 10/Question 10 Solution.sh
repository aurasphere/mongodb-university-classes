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
# DESCRIPTION : Solution for MongoDB University M102's Final Exam Question 10.    #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Creates the data directories.
mkdir data
mkdir data/config
mkdir data/s1
mkdir data/s2

# Starts the config server.
mongod --configsvr --dbpath data/config --replSet repl --port 27019 --fork

# Waits for the server.
sleep 5

# Inits the replica set.
mongo --port 27019 --eval "rs.initiate()"

# Waits for the server.
sleep 10

# Restores the config DB.
mongorestore --port 27019 ..\final_exam.127c39d04bb9\gene_backup_553f1c22d8ca396a7a77dfee\gene_backup\config_server

# Updates the shards configuration and closes the config one.
mongo config --port 27019 --eval "db.shards.update({_id:'s1'},{host:'localhost:27001'}); db.shards.update({_id:'s2'},{host:'localhost:27002'}); db = db.getSiblingDB('admin'); db.shutdownServer({force : true}); quit()"

# Waits for the server.
sleep 5

# Starts the shard servers and restarts the config one.
mongod --port 27001 --dbpath data/s1 --shardsvr --fork
mongod --port 27002 --dbpath data/s2 --shardsvr --fork
mongod --configsvr --dbpath data/config --replSet repl --port 27019 --fork
mongos --configdb repl/localhost:27019 --fork

# Restores the shards DB.
mongorestore --port 27001 ..\final_exam.127c39d04bb9\gene_backup_553f1c22d8ca396a7a77dfee\gene_backup\s1
mongorestore --port 27002 ..\final_exam.127c39d04bb9\gene_backup_553f1c22d8ca396a7a77dfee\gene_backup\s2

# Prints the solution.
mongo snps --eval "db.elegans.createIndex({N2:1,mutant:1}); var executionStats = db.elegans.find( { N2 : 'T', mutant : 'A' } ).limit( 5 ).explain( 'executionStats' ); print('Total shards queried : ' + executionStats.executionStats.executionStages.shards.length); print('Total documents examined : ' + executionStats.executionStats.totalDocsExamined);"