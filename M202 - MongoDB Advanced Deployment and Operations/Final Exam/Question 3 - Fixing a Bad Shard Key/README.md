# Problem
## Final: Question 3: Fixing a Bad Shard Key

Note: Please complete this homework assignment in the provided virtual machine (VM). If you choose to use your native local machine OS, or any environment other than the provided VM, we won't be able to support you.

Suppose you have a sharded collection final_exam.m202 in a cluster with 3 shards. To set up the problem, first initialize a cluster with 3 single-server shards (not replica sets) in the mongo shell using ShardingTest:

    $ mongo --nodb
    > config = { d0 : { smallfiles : "", noprealloc : "", nopreallocj : ""}, d1 : { smallfiles : "", noprealloc : "", nopreallocj : "" }, d2 : { smallfiles : "", noprealloc : "", nopreallocj : ""}};
    > cluster = new ShardingTest( { shards : config } );

Then click "Initialize" in MongoProc, which will verify that you have 3 shards and then insert test data into final_exam.m202.

Unfortunately, even though your shard key {otherID: 1} has high cardinality, the data is not being distributed well among the shards. You have decided that a hashed shard key based on the _id field would be a better choice, and want to reconfigure the collection to use this new shard key. Once you have the cluster using the new shard key for final_exam.m202, test in MongoProc and turn in when correct.