# Problem
You have just been hired at a new company with an existing MongoDB deployment. They are running a single replica set with two members. When you ask why, they explain that this ensures that the data will be durable in the face of the failure of either server. They also explain that should they use a readPreference of "primaryPreferred", that the application can read from the one remaining server during server maintenance.

You are concerned about two things, however. First, a server is brought down for maintenance once a month. When this is done, the replica set primary steps down, and the set cannot accept writes. You would like to ensure availability of writes during server maintenance.

Second, you also want to ensure that all writes can be replicated during server maintenance.

Which of the following options will allow you to ensure that a primary is available during server maintenance, and that any writes it receives will replicate during this time?

Check all that apply.

Check all that apply:

 - Add an arbiter.
 - Add two data bearing members plus one arbiter.
 - Increase the priority of the first server from one to two.
 - Add another data bearing node.
 - Add two arbiters.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>Add two data bearing members plus one arbiter.</li>
	  <li>Add another data bearing node.</li>
	</ul>
</details>