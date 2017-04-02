# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M202_March/handouts/mongod__homework_hw_m202_w3_week3_wk3_536bf5318bb48b4bb3853f31.df30592c9ae3.conf">mongod__homework_hw_m202_w3_week3_wk3_536bf5318bb48b4bb3853f31.conf</a>
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M202_March/handouts/backupt__homework_hw_w3_week3_wk3_536bf4e28bb48b4bb3853ecc.tar.2078fd1f5608.gz">backupt__homework_hw_w3_week3_wk3_536bf4e28bb48b4bb3853ecc.tar.gz</a>
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M202_March/handouts/backupD__homework_m202_w3_week3_wk3_536bf4708bb48b4bb3853ec2.tar.e06c05d8f851.gz">backupD__homework_m202_w3_week3_wk3_536bf4708bb48b4bb3853ec2.tar.gz</a>

## Homework: 2.5: Replaying the oplog

Note: Please complete this homework assignment in the provided virtual machine (VM). If you choose to use your native local machine OS, or any environment other than the provided VM, we won't be able to support you.

This problem will be a hands-on implementation of the last problem.

The backupDB database has one collection, backupColl. Your system is backed up with a mongodump. After one of these, the server continued taking writes until someone (not you) ran the command:

    db.backupColl.drop()
	
Your job is to put your database back into the state it was in immediately before the database was dropped, then use MongoProc to verify that you have done it correctly.

You have been provided with a server directory in the backuptest.tar.gz file that includes your (now empty) data files, the mongodump file in backupDB.tar.gz, and a mongod.conf file. The conf file will set the name of your replica set to "BackupTest" and the port to 30001. Your replica set must have these settings to be graded correct in MongoProc. You may configure the host setting for MongoProc if necessary.

Use MongoProc to evaluate your solution. You can verify that your database is in the correct state with the test button and turn it in once you've passed.

This assignment is fairly tricky so you may want to check <a href="http://stackoverflow.com/questions/15444920/modify-and-replay-mongodb-oplog">this stackoverflow</a> question and answer. An alternative method to the stackoverflow response is using the "mongooplog" tool (there are several solutions to this problem).

If you run into the error with mongorestore "error applying oplog: applyOps: EOF", this issue has been fixed in MongoDB 3.0.4. At the time of this update, 3.0.4 is available for download as a release candidate (The 3.0.4-rc0 mongorestore binary for Ubuntu 14.04 can be a href="https://s3.amazonaws.com/edu-downloads.10gen.com/m202/mongorestore">downloaded here</a> )

Tip: You may not need this, but if you are interested in updating an oplog's 'op' field for a document, it will complain if you increase the size the document (which it thinks is happening as an intermediate stage of an update), but you can do it anyway by simultaneously unsetting another field. For example, db.oplog.rs.update( { query }, { $set : { "op" : "c" }, $unset : { "o" : 1 } } ).

Tip #2: After restoring, you will find that you have 614800 documents in the collection.