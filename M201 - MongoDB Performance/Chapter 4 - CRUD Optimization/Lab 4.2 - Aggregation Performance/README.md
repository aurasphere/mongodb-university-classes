# Problem
For this lab, you're going to create an index so that the following aggregation query can be executed successfully.

After importing the restaurants dataset, without any indexes:

    $ mongoimport -d m201 -c restaurants --drop restaurants.json
			   
If you attempt to run the following query you'll receive an error.
    
    db.restaurants.aggregate([
      { $match: { stars: { $gt: 2 } } },
      { $sort: { stars: 1 } },
      { $group: { _id: "$cuisine", count: { $sum: 1 } } }
    ])
    
    {
      "ok": 0,
      "errmsg": "Sort exceeded memory limit of 104857600 bytes, but did not opt in to external sorting. Aborting operation. Pass allowDiskUse:true to opt in.",
      "code": 16819,
      "codeName": "Location16819"
    }

Identify why this error is occuring, and build an index to resolve the issue.
In the text box below, submit the index that resolves the issue.
For example, if you ran db.restaurants.createIndex({ foobar: 1 }) to fix the error, then you'd enter { foobar: 1 } into the text box.
Note: The index should be ascending in nature.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{ stars: 1 }</li>
	</ul>
</details>
