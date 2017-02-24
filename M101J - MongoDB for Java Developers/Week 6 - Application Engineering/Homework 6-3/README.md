#Problem
Which of the following statements are true about choosing and using a shard key?

Check all that apply:
 - The shard key must be unique
 - There must be a index on the collection that starts with the shard key.
 - MongoDB can not enforce unique indexes on a sharded collection other than the shard key itself, or indexes prefixed by the shard key.
 - Any update that does not contain the shard key will be sent to all shards.
 - You can change the shard key on a collection if you desire.

<details>
  <summary>Click here for the solution</summary>
  - There must be a index on the collection that starts with the shard key.
  - MongoDB can not enforce unique indexes on a sharded collection other than the shard key itself, or indexes prefixed by the shard key.
  - Any update that does not contain the shard key will be sent to all shards.
</details>