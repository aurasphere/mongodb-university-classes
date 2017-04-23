# Problem
Suppose you have a 3 member replica set with the primary in Data Center 2 (DC2) and two secondaries in Data Center 1 (DC1). You have set write concern at w=1. 

<img src="https://s3.amazonaws.com/edu-static.mongodb.com/lessons/m202/chapter+3/data_center.jpg"/> 

Now suppose that your application makes three writes to the primary. However, before these writes have been replicated to either of the secondaries, there is a network partition that prevents communication between DC2 and DC1. The partition lasts for 10 minutes. The application producing writes is able to see all three members of the replica set during the entire network partition between DC2 and DC1. No other problems with your system arise during this period.

You should also assume that all members of the replica set have the same priority.

Which of the following are true about the system during the period of the network partition?

Check all that apply:
 - The application will still be able to read data.
 - The three writes to the primary before the network partition will be replicated to the secondaries when the partition ends.
 - The primary in DC2 will step itself down when the partition occurs.
 - An election will occur when the partition ends.
 - The two secondaries will hold an election when the partition occurs.
 - The application will still be able to write while the partition is up.
 - Only reads will be possible while the partition is up.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>The application will still be able to read data.</li>
	  <li>The primary in DC2 will step itself down when the partition occurs.</li>
      <li>The two secondaries will hold an election when the partition occurs.</li>
	  <li>The application will still be able to write while the partition is up.</li>
	</ul>
</details>