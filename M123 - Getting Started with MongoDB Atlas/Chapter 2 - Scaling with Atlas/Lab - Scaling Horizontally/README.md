# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M123_March/handouts/companies_dataset.a23d4089b32b.zip">companies_dataset.zip</a>
 
In this lab, we will scale out our m123-scaling deployment to use a sharded cluster. Go ahead and reconfigure your current cluster to create a two shard cluster. Remember, that is achieve simply by flipping the appropriate toggle near the bottom of the configuration modal.

Once you have your sharded cluster created, please connect to the cluster in a mongo shell using an admin user. You'll want a user that has permissions to <a href="https://docs.mongodb.com/manual/reference/built-in-roles/?_ga=1.38635303.566621725.1483393028#clusterManager">manage a sharded cluster</a>.

Once connected, please enable sharding on the test collection.

    sh.enableSharding("test")

Then shard the test.companies collection.

    sh.shardCollection("test.companies", {name: 1, created_at: 1})

Finally, download the attached and mongoimport the companies.json file you find. Note that you will need to specify the host, port, username, and password based on the values you can find in the connection string for you cluster.

Once the import has finished, connect to the cluster and copy the output of the following command into the text box below.

    use config
    db.shards.count()

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>2</li>
	</ul>
</details>