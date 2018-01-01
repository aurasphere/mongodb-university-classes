# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M102_October/handouts/gene_backup_553f1c22d8ca396a7a77dfee.zip">gene_backup_553f1c22d8ca396a7a77dfee.zip</a>

We have been asked by our users to pull some data from a previous database backup of a sharded cluster. They'd like us to set up a temporary data mart for this purpose, in addition to answering some questions from the data. The next few questions involve this user request.

First we will restore the backup. Download gene_backup.zip from the Download Handout link and unzip this to a temp location on your computer.

The original cluster that was backed up consisted of two shards, each of which was a three member replica set. The first one named "s1" and the second "s2". We have one mongodump (backup) for each shard, plus the config database. After you unzip you will see something like this:

    $ ls -la
    total 0
    drwxr-xr-x   5 dwight  staff  170 Dec 11 13:47 .
    drwxr-xr-x  17 dwight  staff  578 Dec 11 13:49 ..
    drwxr-xr-x   4 dwight  staff  136 Dec 11 13:45 config_server
    drwxr-xr-x   5 dwight  staff  170 Dec 11 13:46 s1
    drwxr-xr-x   5 dwight  staff  170 Dec 11 13:46 s2

Our data mart will be temporary, so we won't need more than one mongod per shard, nor more than one config server (we are not worried about downtime, the mart is temporary).

As a first step, restore the config server backup and run a mongod config server instance with that restored data. The backups were made with mongodump. Thus you will use the mongorestore utility to restore.

Once you have the config server running, confirm the restore of the config server data by running the last javascript line below in the mongo shell, and entering the 5 character result it returns.

    $ mongo localhost:27019/config
    configsvr>
    configsvr> db
    config
    configsvr> db.chunks.find().sort({_id:1}).next().lastmodEpoch.getTimestamp().toUTCString().substr(20,6)

Notes:
 - You must do this with MongoDB 3.0. The mongorestore may not work with prior versions of MongoDB.
 - If you do not see the prompt with 'configsvr' before the '>', then you are not running as a config server.
Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>39:15</li>
	</ul>
</details>