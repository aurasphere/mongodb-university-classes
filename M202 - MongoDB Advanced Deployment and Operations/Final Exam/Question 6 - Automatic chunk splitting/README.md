# Problem
In a sharded cluster, which of the following can keep large chunks from being split as part of MongoDB's balancing process? Check all that apply.

Note: This question applies to MongoDB 3.0. Do not have the model of config servers as replica sets (CSRS) in mind when answering this question.

Check all that apply:
 - Frequent restarts of all mongos processes relative to the frequency of writes
 - If there are not enough distinct shard key values
 - If one of the config servers is down when a mongos tries to do a split
 - If the average size of the documents in the chunk is too small
 - If the number of shards in the cluster is too small

 <details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>Frequent restarts of all mongos processes relative to the frequency of writes</li>
      <li>If there are not enough distinct shard key values</li>
      <li>If one of the config servers is down when a mongos tries to do a split</li>
	</ul>
</details>