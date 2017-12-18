# Problem
Now enable sharding for the week6 database. (See sh.help() for details.)

Then shard the trades collection on the compound shard key ticker plus time. Note to shard a collection, you must have an index on the shard key, so you will need to create the index first:

    db.trades.createIndex( { ticker : 1, time : 1 } )
    // can now shard the trades collection on the shard key  { ticker:1, time:1 }

After sharding the collection, look at the chunks which exist:

    use config
    db.chunks.find()
    // or:
    db.chunks.find({}, {min:1,max:1,shard:1,_id:0,ns:1})

Run homework.b() to verify the above and enter the return value below.

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>3</li>
	</ul>
</details>