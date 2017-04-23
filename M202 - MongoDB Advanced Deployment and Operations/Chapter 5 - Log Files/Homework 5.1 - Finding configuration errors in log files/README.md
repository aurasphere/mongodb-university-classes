# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M202_March/handouts/configu__bind_ip_bindip_final_log_logs_m202_5395f3568bb48b433e5aff2c.tar.e3c803f0df51.gz">configu__bind_ip_bindip_final_log_logs_m202_5395f3568bb48b433e5aff2c.tar.gz</a>

Download, extract, and examine the log files in the attachment. These are the log files for four servers that were (by the end of the logs) spun up into a single replica set.

Initially, there was a problem with one or more server configuration options. In the log file(s), find the configuration setting that is initially causing the issue.

Enter the field name (not the value) for the setting that is the source of the problem. Do not use numbers, quotation marks, or other punctuation in your answer. For example, if you thought the answer was "logAppend": true (which it definitely isn't), you would type:

     logAppend

When you have your answer, please paste or type it into the box below, and submit. Unfortunately, case/capitalization matters here, so please enter the field name for the setting in question exactly how it appears in the logs.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>bindIp</li>
	</ul>
</details>