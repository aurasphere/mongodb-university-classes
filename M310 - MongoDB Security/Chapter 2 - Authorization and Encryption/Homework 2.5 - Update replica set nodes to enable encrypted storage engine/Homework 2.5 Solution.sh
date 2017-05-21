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
# DESCRIPTION : Solution for MongoDB University M310's Homework 2.5.             #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Kills all the mongo process and waits for them to exit.
pkill mongod
sleep 3

# Initiates the homework.
./setup-hw-2.5.sh

# Generates the encryptionKeyFile on the home folder because you can't change 
# permission on the shared one.
openssl rand -base64 32 > ~/M310-HW-2.5/encryptionKeyFile
chmod 400 ~/M310-HW-2.5/encryptionKeyFile

# Restarts each instance with encryption enabled after deleting the files.
# The collection will be duplicated again and stored with encryption.
mongo admin --port 31251 --eval "db.shutdownServer()"
sleep 3
rm -rf ~/M310-HW-2.5/r1/*
mongod --dbpath ~/M310-HW-2.5/r1 --logpath ~/M310-HW-2.5/r1/mongo.log --port 31251 --replSet UNENCRYPTED --fork --enableEncryption --encryptionKeyFile ~/M310-HW-2.5/encryptionKeyFile

mongo admin --port 31252 --eval "db.shutdownServer()"
sleep 3
rm -rf ~/M310-HW-2.5/r2/*
mongod --dbpath ~/M310-HW-2.5/r2 --logpath ~/M310-HW-2.5/r2/mongo.log --port 31252 --replSet UNENCRYPTED --fork --enableEncryption --encryptionKeyFile ~/M310-HW-2.5/encryptionKeyFile

mongo admin --port 31250 --eval "rs.stepDown()"
mongo admin --port 31250 --eval "db.shutdownServer()"
sleep 3
rm -rf ~/M310-HW-2.5/r0/*
mongod --dbpath ~/M310-HW-2.5/r0 --logpath ~/M310-HW-2.5/r0/mongo.log --port 31250 --replSet UNENCRYPTED --fork --enableEncryption --encryptionKeyFile ~/M310-HW-2.5/encryptionKeyFile
sleep 10

# Validates the homework.
./validate-hw-2.5.sh