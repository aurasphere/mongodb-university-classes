# Problem
Once you've got the namespace and query pattern from the previous problem, use mlogfilter to filter the log file to get only those queries that match both the namespace and the query pattern, and then use mplotqueries to look at the queries in one-second buckets. To make sure you're doing things right, your results should look like this:

<img src="https://s3.amazonaws.com/university-course-image-files/mplotqueries_final_m202_1_second_buckets.png"/>


Your results will have their axes labeled. Examine the highest peak. You can either compare it to the y-axis, or click on it to find out the value.

Your question is this: What is the number of these operations during that one-second bin with the highest peak?

Hint: If you're unfamiliar with the bash commands, you might want, as an intermediate step, to create a new log file. By default, mlogfilter sends its results to stdout, but you can redirect it to a new file by appending> newfile_nameto the end of the command.

Choose the best answer:
 - 60-90 ops/s
 - 120-180 ops/s
 - 300-450 ops/s
 - 600-900 ops/s
 - 1200-1800 ops/s

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>60-90 ops/s</li>
	</ul>
</details>