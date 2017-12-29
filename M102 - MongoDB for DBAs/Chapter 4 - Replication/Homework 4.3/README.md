# Problem
Now add two more members to the set. Use the 2/ and 3/ directories we created in homework 4.1. Run those two mongod's on ports 27002 and 27003 respectively (the exact numbers could be different).

Remember to use the same replica set name as you used for the first member.

You will need to add these two new members to your replica set, which will initially have only one member. In the shell running on the first member, you can see your replica set status with

    rs.status()

Initially it will have just that first member. Connecting to the other members will involve using

    rs.add()

For example,

    rs.add("localhost:27002")

Note that 'localhost' almost certainly won't work for you unless you have already set it as 'localhost' in the previous problem. If not, try using the name in the "members.name" field in the document you get by calling rs.status(), but remember to use the correct port!.

You'll know it's added when you see an

    { "ok" : 1 }

document.

Once a secondary has spun up, you can connect to it with a new mongo shell instance. Use

    rs.slaveOk()

to let the shell know you're OK with (potentially) stale data, and run some queries. You can also insert data on your primary and then read it out on your secondary.

Once you have two secondary servers, both of which have sync'd with the primary and are caught up, run (on your primary):

    homework.c()

and enter the result below.

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>5</li>
	</ul>
</details>