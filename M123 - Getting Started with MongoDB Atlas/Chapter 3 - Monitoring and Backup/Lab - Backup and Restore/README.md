# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M123_March/handouts/atlas_create_backup_data.bf5255527c11.zip">atlas_create_backup_data.zip</a>

In this lab, we will perform a backup operation on a cluster, and then restore it to a point-in-time chosen by us after one particular operation.

Begin by creating a three-node replica set cluster in Atlas using M10s with the default settings.

Once your cluster is ready, download the handout, unzip, and run the script atlas_create_backup_data.js. You may use the following as an example of how to run this script. Run this script as the admin user for your cluster.

    mongo mongodb://CLUSTER --ssl --username USERNAME --password PASSWORD --quiet atlas_create_backup_data.js

The script will add data to the backup database, and will tell you what timestamp/increment from the oplog that you will want to use when restoring your data.

Then, restore the data, connect to your instance, and count the number of documents in the data collection in the backup database:

    use backup
    db.data.count()

How many documents are in this collection?

Choose the best answer:
 - 10
 - 20
 - 30
 - 40
 - 50
 - 60
 - 70
 - 80
 - 90
 - 100

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>30</li>
	</ul>
</details>