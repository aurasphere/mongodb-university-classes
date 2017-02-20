/*
 * MIT License
 * 
 * Copyright (c) 2017 Donato Rimenti
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */ 

/*
 * In this homework you will build a small replica set on your own computer. We
 * will check that it works with MongoProc.
 * 
 * Create three directories for the three mongod processes. On unix, this could
 * be done as follows:
 * 
 * mkdir -p /data/rs1 /data/rs2 /data/rs3 
 * 
 * or on Windows:
 * 
 * mkdir \data\rs1 \data\rs2 \data\rs3 
 * 
 * Now start three mongo instances as follows. Note that are three commands. 
 * The browser is probably wrapping them visually.
 * 
 * Linux and Mac users:
 * 
 * mongod --replSet m101 --logpath "1.log" --dbpath /data/rs1 --port 27017
 * --smallfiles --oplogSize 64 --fork
 * 
 * mongod --replSet m101 --logpath "2.log" --dbpath /data/rs2 --port 27018
 * --smallfiles --oplogSize 64 --fork
 * 
 * mongod --replSet m101 --logpath "3.log" --dbpath /data/rs3 --port 27019
 * --smallfiles --oplogSize 64 --fork 
 * 
 * Windows users:
 * 
 * start mongod --replSet m101 --logpath 1.log --dbpath \data\rs1 --port 27017
 * --smallfiles --oplogSize 64 
 * 
 * start mongod --replSet m101 --logpath 2.log --dbpath \data\rs2 --port 27018
 * --smallfiles --oplogSize 64 
 * start mongod --replSet m101 --logpath 3.log --dbpath \data\rs3 --port 27019
 * --smallfiles --oplogSize 64 
 * 
 * Now connect to a mongo shell and make sure it comes up.
 * 
 * mongo --port 27017 
 * 
 * Now you will create the replica set. Type the following commands into the 
 * mongo shell:
 * 
 * config = { _id: "m101", members:[ 
 * 				{ _id : 0, host : "localhost:27017"}, 
 * 				{ _id : 1, host : "localhost:27018"}, 
 * 				{ _id : 2, host : "localhost:27019"} 
 * 			] };
 * rs.initiate(config); 
 * 
 * At this point, the replica set should be coming up. You can type
 * 
 * rs.status() 
 * 
 * to see the state of replication.
 * 
 * Now go to MongoProc to ensure that it works. Make sure to configure MongoProc
 * to have mongod1 set to the hostname and port of one of the replica set
 * members.
 * 
 * If you need to reinstall it, click here to download mongoProc.
 * 
 * You can also look back to the lesson on using mongoProc from chapter 2 if you
 * have trouble using it.
 */

/*
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! WARNING !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 * 
 * Since this script uses a replicaSet running made up from 3 mongod instances
 * you will need to specify the port when starting the mongo shell, like this:
 * 
 * mongo --port 27017
 * 
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! WARNING !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 */
 
// The configuration used for this replicaSet.
var config = { _id: "m101", members:[
          { _id : 0, host : "localhost:27017"},
          { _id : 1, host : "localhost:27018"},
          { _id : 2, host : "localhost:27019"} ]
};

// Initializes the replicaSet.
rs.initiate(config);

// Prints the status of the replicaSet.
printjson(rs.status());