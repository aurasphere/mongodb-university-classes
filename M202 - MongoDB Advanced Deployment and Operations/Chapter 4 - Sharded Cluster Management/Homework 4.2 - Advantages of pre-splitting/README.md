# Problem
Which of the following are advantages of pre-splitting the data that is being loaded into a sharded cluster, rather than throwing all of the data in and waiting for it to migrate?

Check all that apply:
 - Data can get lost during chunk migration. Pre-splitting allows you to avoid that.
 - You have more control over the shard key if you pre-split.
 - You can decide which shard has which data range initially if you pre-split the data
 - Migration takes time, especially when the system is under load. Pre-splitting allows you to avoid that.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>You can decide which shard has which data range initially if you pre-split the data</li>
      <li>Migration takes time, especially when the system is under load. Pre-splitting allows you to avoid that.</li>
	</ul>
</details>