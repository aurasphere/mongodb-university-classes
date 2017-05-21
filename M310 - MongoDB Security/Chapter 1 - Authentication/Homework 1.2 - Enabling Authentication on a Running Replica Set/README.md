# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-hw-1.2.c8a09ad1e0e8.zip">m310-hw-1.2.zip</a>

For this lab you are going to take a running replica set (that doesn't have authentication enabled) and are going to enable authentication on it.

One of the provided scripts creates a replica set with authentication disabled.

After you've copied the handout scripts into the shared folder, run the following commands inside the VM in order to start the replica set.

    $ cd ~/shared
    $ ./setup-hw-1.2.sh

You can inspect setup-hw-1.2.sh to see the parameters used to set up the replica set, but for convenience here's that information.

    Type	Primary	Secondary	Secondary
    Port	31120	31121	31122
    DBPath	~/M310-HW-1.2/r0	~/M310-HW-1.2/r1	~/M310-HW-1.2/r2
    LogPath	~/M310-HW-1.2/r0/mongodb.log	~/M310-HW-1.2/r1/mongodb.log	~/M310-HW-1.2/r2/mongodb.log

In order to enable authentication on this running replica set you're going to need to figure out how to perform the following tasks.

 - Create a keyfile to use for internal authentication between the members of the replica set.
 - Safely shutdown each member of the replica set, starting with the secondaries to prevent any rollbacks.
 - Starting with the primary, restart each member using the shared keyfile you generated.
 - Finally, create a user with the root role with the username admin and the password webscale on the admin database.

Note: If you don't create a user with these credentials, you will not get the correct output for submitting your answer.

After you've enabled authentication on the replica set you can run the following script and copy the output into the submission area below.

    $ cd ~/shared
    $ ./validate-hw-1.2.sh

Note: If you've successfully enabled authentication on the replica set, then the validation script should output a JSON object with two keys: unauthorizedStatus and memberStatuses. The first key confirms that authentication is enabled, and the second verifies that all members are still up and running.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{ unauthorizedStatus: { "ok" : 0, "errmsg" : "not authorized on admin to execute command { replSetGetStatus: 1.0 }", "code" : 13 }, memberStatuses: ["PRIMARY","SECONDARY","SECONDARY"] }</li>
	</ul>
</details>