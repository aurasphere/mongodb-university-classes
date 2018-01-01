# Problem
Now, for our temporary data mart, once again from a mongo shell connected to the cluster:

1) create an index { N2 : 1, mutant : 1 } for the "snps.elegans" collection.
2) now run:
    
	db.elegans.find( { N2 : "T", mutant : "A" } ).limit( 5 ).explain( "executionStats" )

Based on the explain output, which of the following statements below are true?

Check all that apply:

 - No shards are queried.
 - 1 shard in total is queried.
 - 2 shards in total are queried.
 - 5 documents in total are examined.
 - 7 documents in total are examined.
 - 8 documents in total are examined.
 - Thousands of documents are examined.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>2 shards in total are queried.</li>
	  <li>8 documents in total are examined.</li>
	</ul>
</details>