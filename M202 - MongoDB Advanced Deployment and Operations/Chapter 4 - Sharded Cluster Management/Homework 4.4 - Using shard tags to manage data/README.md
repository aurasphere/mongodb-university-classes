# Problem
## Homework: 4.4: Using shard tags to manage data

Note: Please complete this homework assignment in the provided virtual machine (VM). If you choose to use your native local machine OS, or any environment other than the provided VM, we won't be able to support you.

In this problem we will emulate a data management strategy in which we periodically move data from short-term storage (STS) to long-term storage (LTS). We have implemented this strategy using tag-based sharding.

Start by spinning up a sharded cluster as follows:

    $ mongo --nodb
    > config = { d0 : { smallfiles : "", noprealloc : "", nopreallocj : ""}, d1 : { smallfiles : "", noprealloc : "", nopreallocj : "" }, d2 : { smallfiles : "", noprealloc : "", nopreallocj : ""}};
    > cluster = new ShardingTest( { shards : config } );
	
This will create 3 standalone shards on ports 30000, 30001, and 30002, as well as a mongos on port 30999. The config portion of the above will eliminate the disk space issues some students have seen when using ShardingTest.

Next, initialize the data in this cluster using MongoProc. You can choose the host you're pointing to, but MongoProc will be looking for the mongos at port 30999.

Following initialization, your system will contain the collection testDB.testColl. Once initial balancing completes, all documents in this collection with a createdDate field value from October 1, 2013 until the end of 2013 are in LTS and all documents created in 2014 are in STS. There are two shards used for LTS and one shard for STS.

Your assignment is to move all data for the month of January 2014 into LTS as part of periodic maintenance. For this problem we are pretty sure you can "solve" it in a couple of ways that are not ideal. In an ideal solution you will make the balancer do the work for you. Please note that the balancer must be running when you turn in your solution.

Please keep in mind that:

this problem has only been tested in the course VM.
shard tag ranges are inclusive of the lower bound, and exclusive of the upper bound.
If you have an empty chunk at the end, you will need to merge it. There is a tutorial here.