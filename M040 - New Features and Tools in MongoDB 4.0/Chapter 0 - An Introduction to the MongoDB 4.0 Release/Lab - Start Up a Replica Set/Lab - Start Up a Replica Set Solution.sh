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
# DESCRIPTION : Solution for MongoDB University M040's Lab 0.                    #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2018 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Creates the directories for the servers.
mkdir -p /data/db/m040/repl/{1,2,3}

# Starts up the servers.
mongod -f /shared/rs1_linux.conf
mongod -f /shared/rs2_linux.conf
mongod -f /shared/rs3_linux.conf

# Initiates the replicaSet.
mongo --eval 'rs.initiate()'
mongo --eval 'rs.add("m040:27027");rs.add("m040:27037")'

# Gives some time to the replicaSet for configuration.
sleep 10

# Validates the lab.
mongo --quiet validate_lab1.js