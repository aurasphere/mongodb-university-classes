# Problem
## Final: Question 7: Traffic Imbalance in a Sharded Environment

Note: Please complete this homework assignment in the provided virtual machine (VM). If you choose to use your native local machine OS, or any environment other than the provided VM, we won't be able to support you.

In this problem, you have a cluster with 2 shards, each with a similar volume of data, but all the application traffic is going to one shard. You must diagnose the query pattern that is causing this problem and figure out how to balance out the traffic.

To set up the scenario, run the following commands to set up your cluster. The config document passed to ShardingTest will eliminate the disk space issues some students have seen when using ShardingTest.

    mongo --nodb
    config = { d0 : { smallfiles : "", noprealloc : "", nopreallocj : ""}, d1 : { smallfiles : "", noprealloc : "", nopreallocj : "" } };
    cluster = new ShardingTest( { shards: config } );

Once the cluster is up, click "Initialize" in MongoProc one time to finish setting up the cluster's data and configuration. If you are running MongoProc on a machine other than the one running the mongos, then you must change the host of 'mongod1' in the settings. The host should be the hostname or IP of the machine on which the mongos is running. MongoProc will use port 30999 to connect to the mongos for this problem.

Once the cluster is initialized, click the "Initialize" button in MongoProc again to simulate application traffic to the cluster for 1 minute. You may click "Initialize" as many times as you like to simulate more traffic for 1 minute at a time. If you need to begin the problem again and want MongoProc to reinitialize the dataset, drop the m202 database from the cluster and click "Initialize" in MongoProc.

Use diagnostic tools (e.g., mongostat and the database profiler) to determine why all application traffic is being routed to one shard. Once you believe you have fixed the problem and traffic is balanced evenly between the two shards, test using MongoProc and then turn in if the test completes successfully.

Note:Dwight discusses the profiler in M102.