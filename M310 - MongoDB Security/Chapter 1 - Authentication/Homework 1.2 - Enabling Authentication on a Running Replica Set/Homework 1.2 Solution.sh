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
# DESCRIPTION : Solution for MongoDB University M310's Homework 1.2.             #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Kills all the mongo process and waits for them to exit.
pkill mongod
sleep 3

# Sets up the homework.
./setup-hw-1.2.sh

# Generates the keyfile on the home folder because you can't change permission on
# the shared one.
openssl rand -base64 756 > $HOME/keyfile
chmod 400 $HOME/keyfile

# Restarts the mongo servers with the keyfile configuration.
mongo admin --port 31121 --eval "db.shutdownServer()"
mongo admin --port 31122 --eval "db.shutdownServer()"
mongo admin --port 31120 --eval "db.shutdownServer()"

mongod --dbpath "$HOME/M310-HW-1.2/r0" --logpath "$HOME/M310-HW-1.2/r0/mongo.log.log" --port 31120 --replSet TO_BE_SECURED --fork --keyFile $HOME/keyfile
mongod --dbpath "$HOME/M310-HW-1.2/r1" --logpath "$HOME/M310-HW-1.2/r1/mongo.log.log" --port 31121 --replSet TO_BE_SECURED --fork --keyFile $HOME/keyfile
mongod --dbpath "$HOME/M310-HW-1.2/r2" --logpath "$HOME/M310-HW-1.2/r2/mongo.log.log" --port 31122 --replSet TO_BE_SECURED --fork --keyFile $HOME/keyfile

# Waits for the mongo servers to fully come up.
sleep 10

# Creates the user admin with password webscale.
mongo admin --port 31120 --eval 'db.createUser({user:"admin",pwd:"webscale",roles:["root"]})'

# Validates the homework.
./validate-hw-1.2.sh