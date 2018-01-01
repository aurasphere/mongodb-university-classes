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
# DESCRIPTION : Solution for MongoDB University M102's Final Exam Question 2.    #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Starts the servers with the provided script.
..\final_exam.127c39d04bb9\rollback_553ed0e3d8ca3966d777dfe0\a.bat

# Waits for the script to end.
sleep 5

# Inits the replica set.
mongo --port 27003 --eval "load('../final_exam.127c39d04bb9/rollback_553ed0e3d8ca3966d777dfe0/a.js'); ourinit();"

# Waits for the init.
sleep 20

# Steps down the first server in case it's the primary.
mongo --port 27001 --eval "rs.stepDown();"

# Waits for the stepdown.
sleep 2

# Inserts some record into the DB.
mongo test --port 27003 --eval "db.foo.insertMany( [{ _id : 1 }, { _id : 2 }, { _id : 3 }], { writeConcern : { w : 2 } } );" 

# Shutdown the first server.
mongo admin --port 27001 --eval "db.shutdownServer();"

# Waits for the server to shutdown.
sleep 5

# Inserts other records.
mongo test --port 27003 --eval "db.foo.insertMany( [{ _id : 4 }, { _id : 5 }, { _id : 6 }] );"

# Shutdown the other server.
mongo admin --port 27003 --eval "db.shutdownServer({force : true});"

# Starts the first server.
mongod --port 27001 --dbpath data/z1 --replSet z --fork

# Waits for the server to startup.
sleep 10

# Adds a new record.
mongo --port 27001 --eval "db.foo.insert( { _id : 'last' } );"

# Starts the last server.
mongod --port 27003 --dbpath data/z3 --replSet z --fork

# Waits for the server to startup.
sleep 10

# Prints the solution.
mongo --port 27001 --eval "rs.slaveOk(); var result = db.foo.find(); print('Solution : '); while (result.hasNext()) {printjson(result.next());}"