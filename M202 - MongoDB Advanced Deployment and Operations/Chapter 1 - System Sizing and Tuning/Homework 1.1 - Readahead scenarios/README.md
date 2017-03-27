# Problem
You are performing an aggregation query with $sort, and are hitting the maximum size limit for in-memory sort. Which of the following might resolve this problem?

Hint: You will probably have to go to thedocumentationand consult aggregation to research the answer to this problem. This is intentional. Also you should also first rule out answers that are obviously incorrect.

Check all that apply:
 - Set the "allowDiskUse" parameter to true
 - Switch out your HDD for an SSD so that data can be accessed more quickly
 - Move your system to another machine with a faster CPU
 - Add an index for the variable(s) you are using to sort the documents
 - If you are not already doing so, include a $match earlier in the pipeline that will reduce the number of documents you are sorting

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>Set the "allowDiskUse" parameter to true</li>
	  <li>Add an index for the variable(s) you are using to sort the documents</li>
      <li>If you are not already doing so, include a $match earlier in the pipeline that will reduce the number of documents you are sorting</li>
	</ul>
</details>