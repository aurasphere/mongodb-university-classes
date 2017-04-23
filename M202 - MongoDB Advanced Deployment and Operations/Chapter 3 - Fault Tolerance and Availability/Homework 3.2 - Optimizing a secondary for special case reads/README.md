# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M202_March/handouts/spin-up-three-member-replica-set.ac7861d7779f.sh">spin-up-three-member-replica-set.sh</a>

## Homework: 3.2: Optimizing a secondary for special case reads

Note: Please complete this homework assignment in the provided virtual machine (VM). If you choose to use your native local machine OS, or any environment other than the provided VM, we won't be able to support you. If you use the provided handout script to initiate the replica set, please run it in the ``/data`` directory. However, for extra practice, we encourage you to set up the replica set yourself usingconfiguration files.

Suppose you have an application on which you want to run analytics monthly against a MongoDB 3.0 server. The analytics require an index and for performance reasons you will create the index on a secondary. Initiate a replica set with a primary, a secondary, and an arbiter. Create an index on the secondary only. The index should be on the "a" field of the "testDB.testColl" collection.

When you have created the index on the secondary, test with MongoProc to be sure you've completed the problem correctly and then submit.

Note: If you have any documents in the testDB.testColl collection when you test or submit with MongoProc they will be removed.