# Problem
We will now remove the first member (@ port 27001) from the set.

As a first step to doing this we will shut it down. (Given the rest of the set can maintain a majority, we can still do a majority reconfiguration if it is down.)

We could simply terminate its mongod process, but if we use the replSetStepDown command, the failover may be faster. That is a good practice, though not essential. Connect to member 1 (port 27001) in the shell and run:

    rs.stepDown()

Then cleanly terminate the mongod process for member 1.

Next, go to the new primary of the set. You will probably need to connect with the mongo shell, which you'll want to run with '--shell replication.js' since we'll be getting the homework solution from there. Once you are connected, run rs.status() to check that things are as you expect. Then reconfigure to remove member 1.

Tip: You can either use rs.reconfig() with your new configuration that does not contain the first member, or rs.remove(), specifying the host:port of the server you wish to remove as a string for the input.

When done, run:

    > homework.d()

and enter the result.

Trouble-Shooting Tips

 - Make sure that your replica set has _id's 0, 1, and 2 set. If you didn't use a custom config, you should be fine, but this is an issue that has come up when using custom configurations.
 - If you ran the shell without replication.js on the command line, restart the shell with it.

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>6</li>
	</ul>
</details>