# Problem
Note our replica set now has an even number of members, and that is not a best practice. However, to keep the homework from getting too long we'll leave it at that for now, and instead do one more exercise below involving the oplog.

To get the right answer on this problem, you must perform the homework questions in order. Otherwise, your oplog may look different than we expect.

Go to the secondary in the replica set. The shell should say SECONDARY at the prompt if you've done everything correctly.

Switch to the local database and then look at the oplog:

    db.oplog.rs.find()

If you get a blank result, you are not on the right database.

Note: as the local database doesn't replicate, it will let you query it without entering "rs.slaveOk()" first.

Next look at the stats on the oplog to get a feel for its size:

    db.oplog.rs.stats()

What result does this expression give when evaluated?

    db.oplog.rs.find( { } ).sort( { $natural : 1 } ).limit( 1 ).next( ).o.msg[0]

Note that if you inserted many documents (more than around 500,000), your oplog will roll over and eliminate the document that you need. If this happens, you'll need to repeat the previous problems with a set of clean directories in order to find the answer to this question.

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>R</li>
	</ul>
</details>