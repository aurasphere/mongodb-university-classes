# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M202_March/handouts/primary_from_rs_with_corrupt_data_files_mmapv1.tar.2d0db21c343d.gz">primary_from_rs_with_corrupt_data_files_mmapv1.tar.gz</a>
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M202_March/handouts/secondary_from_rs_with_corrupt_data_files_mmapv1.tar.e64a2e4bdb06.gz">secondary_from_rs_with_corrupt_data_files_mmapv1.tar.gz</a>
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M202_March/handouts/arbiter_from_rs_with_corrupt_data_files_mmapv1.tar.5e938409f282.gz">arbiter_from_rs_with_corrupt_data_files_mmapv1.tar.gz</a>

## Homework: 2.1: Broken node, corrupt data files

Note: Please complete this homework assignment in the provided virtual machine (VM). If you choose to use your native local machine OS, or any environment other than the provided VM, we won't be able to support you.

In this problem we have provided you with a replica set that is corrupted. You will start out with a working primary, a corrupted secondary, and a working arbiter. Your goal is to recover the replica set by doing the necessary work to ensure the secondary has an uncorrupted version of the data.

Please download and extract the handouts. There are three data directories: one for the primary, secondary, and arbiter. On your guest VM, you will need to run mongods for each of these on ports 30001, 30002, and 30003. If you initially find that the mongod running on port 30002 is a primary, please step it down. To get the replica set up and running, each node should be launched as follows (note: the dbpath directory for each node is located within a subdirectory of each handout):

 - Primary:

    mongod --port 30001 --dbpath mongod-pri --replSet CorruptionTest --smallfiles --oplogSize 128 --nojournal

 - Secondary

    mongod --port 30002 --dbpath mongod-sec --replSet CorruptionTest --smallfiles --oplogSize 128 --nojournal

 - Arbiter

    mongod --port 30003 --dbpath mongod-arb --replSet CorruptionTest --nojournal

For this problem, do not attempt to configure MongoProc's port settings. You may still configure the host setting.

The corrupt data is in the data files found within the mongod-sec directory. Specifically, the testColl collection of the testDB database is corrupted. You can generate an error due to the corruption by running a .find().explain("executionStats") query on this collection (e.g. "use testDB; db.testColl.find().explain("executionStats")" to show the corruption error).

Bring the secondary back on line with uncorrupted data. When you believe you have done this, use MongoProc to test and, if correct, submit the homework