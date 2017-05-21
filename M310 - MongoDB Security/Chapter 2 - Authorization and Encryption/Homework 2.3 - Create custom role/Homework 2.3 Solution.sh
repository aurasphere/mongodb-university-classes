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
# DESCRIPTION : Solution for MongoDB University M310's Homework 2.3.             #
# AUTHOR : Donato Rimenti                                                        #
# COPYRIGHT : Copyright (c) 2017 Donato Rimenti                                  #
# LICENSE : MIT                                                                  #
#                                                                                #
# ============================================================================== #

# Kills all the mongo process and waits for them to exit.
pkill mongod
sleep 3

# Creates the directory structure.
mkdir -p ~/M310-HW-2.3

# Starts the mongo instance.
mongod --dbpath ~/M310-HW-2.3 --logpath ~/M310-HW-2.3/mongo.log --port 31230 --fork

# Creates the users.
mongo admin --port 31230 --eval 'db.createRole({
  role: "HRDEPARTMENT",
  privileges: [
    {
      resource: { db: "HR", collection: "" },
      actions: [ "find", "dropUser" ]
    }, {
      resource: { db: "HR", collection: "employees" },
      actions: [ "insert" ]
    }
  ],
  roles:[]
})
'

mongo admin --port 31230 --eval 'db.createRole({
  role: "MANAGEMENT",
  privileges: [{
    resource: { db: "HR", collection: "" },
    actions: [ "insert" ]
  }],
  roles:[{
    role: "dbOwner", db: "HR"
  }]
})'

mongo admin --port 31230 --eval 'db.createRole({
  role: "EMPLOYEEPORTAL",
  privileges: [{
    resource: { db: "HR", collection: "employees" },
    actions: [ "find", "update" ]
  }],
  roles:[]
})'

# Validates the homework.
./validate-hw-2.3.sh