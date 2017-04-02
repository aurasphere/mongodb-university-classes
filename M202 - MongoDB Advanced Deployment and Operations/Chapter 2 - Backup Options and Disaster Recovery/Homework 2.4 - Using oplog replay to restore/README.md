# Problem
Suppose that last night at midnight you took a snapshot of your database with mongodump. At a later time, someone accidentally dropped the only collection in the database using db.collection.drop(). You wish to restore the database to the state it was in immediately before the collection was dropped by replaying the oplog.

Which of the following are steps you should take in order for this to be successful? Check all that apply.

Check all that apply:
 - Prevent the writes that occurred before the backup from taking place.
 - Prevent the db.collection.drop() command in the oplog from being replayed.
 - Prevent any writes that occurred after the drop() command from being replayed.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>Prevent the db.collection.drop() command in the oplog from being replayed.</li>
	  <li>Prevent any writes that occurred after the drop() command from being replayed.</li>
	</ul>
</details>