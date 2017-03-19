# Problem
##Homework: Homework 6.5 (MongoProc)

*Preface to Homework 6.5 (MongoProc)*
In this homework you will build a small replica set on your own computer. We will check that it works with MongoProc.

Create three directories for the three mongod processes. On unix, this could be done as follows:

    mkdir -p /data/rs1 /data/rs2 /data/rs3

or on Windows:

    mkdir \data\rs1 \data\rs2 \data\rs3

Now start three mongo instances as follows. Note that are three commands. The browser is probably wrapping them visually.

Linux and Mac users:

    mongod --replSet m101 --logpath "1.log" --dbpath /data/rs1 --port 27017 --smallfiles --oplogSize 64 --fork
    
    mongod --replSet m101 --logpath "2.log" --dbpath /data/rs2 --port 27018 --smallfiles --oplogSize 64 --fork
    
    mongod --replSet m101 --logpath "3.log" --dbpath /data/rs3 --port 27019 --smallfiles --oplogSize 64 --fork

Windows users:

    start mongod --replSet m101 --logpath 1.log --dbpath \data\rs1 --port 27017 --smallfiles --oplogSize 64
    start mongod --replSet m101 --logpath 2.log --dbpath \data\rs2 --port 27018 --smallfiles --oplogSize 64
    start mongod --replSet m101 --logpath 3.log --dbpath \data\rs3 --port 27019 --smallfiles --oplogSize 64

Now connect to a mongo shell and make sure it comes up.

    mongo --port 27017

Now you will create the replica set. Type the following commands into the mongo shell:

    config = { _id: "m101", members:[
              { _id : 0, host : "localhost:27017"},
              { _id : 1, host : "localhost:27018"},
              { _id : 2, host : "localhost:27019"} ]
    };
    rs.initiate(config);

At this point, the replica set should be coming up. You can type

    rs.status()

to see the state of replication.

Now go to MongoProc to ensure that it works. Make sure to configure MongoProc to have mongod1 set to the hostname and port of one of the replica set members.

If you need to reinstall it, click here to download mongoProc.

You can also look back to the lesson on using mongoProc from chapter 2 if you have trouble using it.