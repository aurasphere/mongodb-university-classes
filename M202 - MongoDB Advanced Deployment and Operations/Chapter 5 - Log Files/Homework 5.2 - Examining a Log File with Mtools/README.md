# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M202_March/handouts/mtools___log_mtools_53ea89e78bb48b138d725182.tar.98100b9062f3.gz">mtools___log_mtools_53ea89e78bb48b138d725182.tar.gz</a>
 
In this problem, you will examine a log file with mtools and determine what is causing problems.

Download and unpack the handout, then find the namespace and the query pattern (called the "query shape" by the docs) that the server has cumulatively spent the most time working on. You'll want to use mloginfo for this step. To help ensure that you're on the right track, this will be the namespace and query pattern that has taken, cumulatively, 2038017 ms of operation time in this log file, or a little under 34 minutes.

If you've ran the correct command your output should look similar to the following:

    namespace               pattern                              count   min (ms)   max (ms)   mean (ms)   95%-ile (ms)   sum (ms)
    website.pageview        {"page": 1, "count": {"$gte": 1}}     3350         21        871         116          386.0     390638
    website.users           {"_id": 1}                            2299         23        129          33           82.0      76223

Unless you are already familiar with mloginfo, you may want to examine the docs.

When you have the answer, please enter the pattern from your results. In the example above, you would enter { "page" : 1, "count" : { "$gte" : 1 } }.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{"_id": 1, "l": {"$not": 1}}</li>
	</ul>
</details>