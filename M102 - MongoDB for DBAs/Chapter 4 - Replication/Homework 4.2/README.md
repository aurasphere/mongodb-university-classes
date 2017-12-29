# Problem
Now convert the mongod instance (the one in the problem 4.1 above, which uses "--dbpath 1") to a single server replica set. To do this, you'll need to stop the mongod (NOT the mongo shell instance) and restart it with "--replSet" on its command line. Give the set any name you like.

Then go to the mongo shell. Once there, run

    rs.initiate()

Note: if you do not specify a configuration, the mongod will pick one based on your computer's hostname.

When you first ran homework.init(), we loaded some data into the mongod. You should see it in the replication database. You can confirm with:

    use replication
    db.foo.find()

Once done with that, run

    homework.b()

in the mongo shell and enter that result below.

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>5002</li>
	</ul>
</details>