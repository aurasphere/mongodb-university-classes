# Problem
You are running a service with a predictable traffic usage pattern. Every Monday the usage peaks at 100,000 reads/sec on your replica set at 17:00 UTC.

For each of the next four days, the peak is 2% higher than the previous day (so 102,000 reads/sec on Tuesday, 104,040 on Wednesday, 106,121 on Thursday, 108,243 on Friday) at 17:00 UTC each day. Saturday and Sunday see significantly reduced traffic, at peaks of 50,000. This pattern repeats each week.

You have nine servers that are evenly distributed across three data centers. The application uses a read preference of secondary. Each of the nine servers has been benchmarked to handle 24,000 reads/sec at its maximum capacity.

There is a further mandate to avoid exceeding 90% of available capacity, if at all possible, for performance reasons. If the application exceeds 90%, this must be reported and escalated to the executive level.

You have deployed the servers as follows:

 - Data Center A: Primary, Secondary, Secondary
 - Data Center B: Secondary, Secondary, Secondary
 - Data Center C: Secondary, Secondary, Secondary

A failure occurs at 19:00 UTC on a Saturday when Data Center C becomes unavailable, along with its servers. Based on the description above, by when must you fix the issue in order to be sure you do not exceed the 90% capacity rule and cause escalations to happen?

Assumptions:

 - The load is evenly distributed across all available secondaries, and redistributes itself shortlyafter the failure.
 - The load does not deviate from the prediction.
 - You cannot read from the primary.
 - All assumptions here are reasonable. ;-)

Choose the best answer:
 - Before the peak on Sunday
 - Before the peak on Monday
 - Before the peak on Tuesday
 - Before the peak on Wednesday
 - Before the peak on Thursday
 - Before the peak on Friday
 - Before the peak on next Saturday

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>Before the peak on Friday</li>
	</ul>
</details>