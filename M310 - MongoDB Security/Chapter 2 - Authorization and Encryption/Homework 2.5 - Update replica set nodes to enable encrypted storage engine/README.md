# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M310_April/handouts/m310-hw-2.5.74a821386c3b.zip">m310-hw-2.5.zip</a>

For this homework exercise you are going to take a running replica set (that doesn't have its storage encrypted), and are to enable the encrypted storage engine via a keyfile in a rolling fashion with no downtime.

One of the provided scripts creates a basic replica set.

After you've copied the handout scripts into the shared folder, run the following commands inside the VM in order to start the replica set.

    $ cd ~/shared
    $ ./setup-hw-2.5.sh

You can inspect setup-hw-2.5.sh to see the parameters used to set up the replica set, but for convenience here's that information.

    Type	Primary	Secondary	Secondary
    Port	31250	31251	31252
    DBPath	~/M310-HW-2.5/r0	~/M310-HW-2.5/r1	~/M310-HW-2.5/r2
    LogPath	~/M310-HW-2.5/r0/mongodb.log	~/M310-HW-2.5/r1/mongodb.log	~/M310-HW-2.5/r2/mongodb.log

The name of the replica set is UNENCRYPTED.

In order to perform this rolling upgrade to enable the encrypted storage engine you're going to need to figure out how to perform the following tasks.

 1.Create a keyfile to use as the external master key.
 2.Safely shutdown a secondary of the replica set and delete the old database files.
 3.Restart the server with storage encryption enabled.
 4.Repeat steps 2 and 3 for the other secondary.
 5.Step down the primary and repeat steps 2 and 3 on the former primary.

Note: for more information on performing a rolling upgrade take a look at this <a href="https://www.mongodb.com/blog/post/your-ultimate-guide-to-rolling-upgrades?_ga=2.108299206.552938967.1494802333-566621725.1483393028">blog post</a>.

After you've successfully enabled storage engine encryption on the replica set you can run the following script and copy the output into the submission area below.

    $ cd ~/shared
    $ ./validate-hw-2.5.sh

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{"doc":{"_id":{},"str":"The quick brown fox jumps over the lazy dog"},"isEnabled":true}</li>
	</ul>
</details>