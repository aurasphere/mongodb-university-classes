# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M123_March/handouts/atlas_lab_create_alerts.5832a42b0c1c.zip">atlas_lab_create_alerts.zip</a>

Before beginning this lab, please create a three-node replica set cluster in Atlas using M10s with the default settings.

Once your cluster is ready, create the following alerts:

 - alert 1: alert by email if Opcounter: Insert increases above 300 (avg/sec)
 - alert 2: alert by email if DB Storage grows beyond 100MB
 - alert 3: alert by email if Opcounter: Query increases above 300 (avg/sec)

Once these alerts have been created, download the handout, unzip and run the script atlas_lab_create_alerts.js. You may use the following as an example of how to run this script. Make sure the user you specify has read and write access to the test database.

    mongo mongodb://CLUSTER --ssl --username USERNAME --password PASSWORD --quiet atlas_lab_create_alerts.js

After the script has run for a few minutes, you should see an alert notice in Atlas. The user you've set up as owner for your Atlas group should also receive email notification. Which of the following alerts was triggered by the script? Please terminate the cluster when you have completed this lab.

Check all that apply:
 - alert 1
 - alert 2
 - alert 3

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>alert 1</li>
	</ul>
</details>