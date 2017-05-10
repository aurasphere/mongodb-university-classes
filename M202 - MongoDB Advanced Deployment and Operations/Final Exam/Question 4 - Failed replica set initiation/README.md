# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M202_March/handouts/logs-failed-rs-initiate__m202.3d4c175f068f">logs-failed-rs-initiate__m202</a>
 
Please examine the attached log files. In this scenario, a replica set is initiated on one server with rs.initiate(). Once it successfully initialized, a second member was spun up and added to the replica set with rs.add().

Before it was successfully added, there was a connection problem. What was it?

Choose the best answer:
 - A network partition
 - One of the members went down while the second member was being added to the set
 - The replica set names in the configs for the two members were different
 - There were too many connections to one of the members
 - The replica set config points to the wrong IP address
 
 <details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>A network partition</li>
	</ul>
</details>