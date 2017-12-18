# Problem
Consider the following scenario: You have a two member replica set, a primary, and a secondary.

The data center with the primary goes down, and is expected to remain down for the foreseeable future. Your secondary is now the only copy of your data, and it is not accepting writes. You want to reconfigure your replica set config to exclude the primary, and allow your secondary to be elected, but you run into trouble. Find out the optional parameter that you'll need, and input it into the box below for your rs.reconfig(new_cfg, OPTIONAL PARAMETER).

Hint: You may want to use this <a href="http://docs.mongodb.org/manual/tutorial/reconfigure-replica-set-with-unavailable-members/?_ga=2.26470589.1829481964.1513586031-2007941820.1506504772">documentation page</a> to solve this problem.

Your answer should be of the form { key : value } (including brackets). Do not include the rs.reconfig portion of the query, just the options document.

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{force : true}</li>
	</ul>
</details>