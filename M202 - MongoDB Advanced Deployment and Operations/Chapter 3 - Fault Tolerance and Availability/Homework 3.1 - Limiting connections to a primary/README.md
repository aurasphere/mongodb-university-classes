# Problem
Suppose you have a sharded cluster for which each shard is a 3-node replica set running MongoDB 3.0. You are concerned about limiting the number of connections in order to help ensure predictable behavior. Given the constraints of your system, you have decided to use 10GB as the amount of memory allocated to determine the maximum connections on the primary.

Using the formula discussed earlier in this chapter, determine the value to which you should set maxConns for each mongos in this cluster if you want to limit primary connections to a ~90% utilization level. Your cluster is using 64 mongos routers, and the number of other possible connections to a primary is 6.

Please calculate the maxConns value to achieve 90% utilization and round down to the nearest integer. Enter only the integer in the box below or your answer will be considered incorrect.

Note: For consistency with the lesson video, please assume that 10,000 connections consume 10GB of RAM.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>140</li>
	</ul>
</details>