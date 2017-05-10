# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M202_March/handouts/mtools___log_mtools_53ea89e78bb48b138d725182.tar.98100b9062f3.gz">mtools___log_mtools_53ea89e78bb48b138d725182.tar.gz</a>
 
For this problem, start over with your original, unfiltered log file. It has been included again as a handout for your convenience.

The log file has an event where there was a sharp spike in incoming connections. Use mplotqueries to plot a chart that shows the connection churn in one-second intervals (buckets). Find the exact second when this connection spike begins. If you click on the first green bar of the connection spike, you can read the time printed in the shell. You can also zoom in close enough to read the second at the x-axis.

Once you've found the start of the spike, use mlogfilter to slice out a time windows from the log file, beginning at the time you found, and lasting 5 seconds. Store the matching log lines in a temporary file by appending > tempfile.log, or pipe it to the next command.

Use mplotqueries to create a scatter plot of the 5-second log window. Look at that highest spike you see. Click on some of the operations to get details in the shell.

What is the write concern of these operations?

Choose the best answer:
 - { w : 0 }
 - { w : 1 }
 - { w : 2 }
 - { w : 3 }
 - { w : 'majority' }
 - { j : true }

 <details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{ w : 2 }</li>
	</ul>
</details>