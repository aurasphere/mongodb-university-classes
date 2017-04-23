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
# DESCRIPTION : Solution for MongoDB University M202's Homework 2-5.             #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Makes a backup of the oplog.
mongodump -d local -c oplog.rs -o oplog --port 30001
mongo backupDB --eval "db.dropDatabase()" --port 30001
mongorestore --port 30001 chapter_2_backup_options_and_disaster_recovery.fc802e5f557f/backupD__homework_m202_w3_week3_wk3_536bf4708bb48b4bb3853ec2/backupDB/backupColl.bson

# Restores replaying the oplog until the dump operation (found out with the js script).
mongorestore --oplogReplay --oplogLimit 1398778745:1 --oplogFile oplog/local/oplog.rs.bson --port 30001 .