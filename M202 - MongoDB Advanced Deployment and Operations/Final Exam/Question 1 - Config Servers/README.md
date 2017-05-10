# Problem
## Final: Question 1: Config Servers

Note: Please complete this homework assignment in the provided virtual machine (VM). If you choose to use your native local machine OS, or any environment other than the provided VM, we won't be able to support you.

In this assignment, you will fix a problem that sometimes arises with config servers in a sharded cluster.

Start by running:

    mongo --nodb
    cluster = new ShardingTest( { shards: 1 , rs : { nodes : [ { } ] }, config : 3 } )

Next, click the "Initialize" button in MongoProc. This will create the problem you will need to fix.

You can see the issue if you try to split a chunk in the 'testDB.testColl' collection with:

    db.adminCommand( { split : "testDB.testColl", middle : { _id : 7 } } )

This will fail. Your job is to track down the problem and solve it. When you think you've got it, test it with MongoProc and submit when finished.

Hint: You will almost certainly need to spin up your own config server separately from the ShardingTest. Make sure you use all of the same parameters used by ShardingTest when starting config servers. You can see these parameters by typing

    ps ax | grep mongo

in a Linux shell.