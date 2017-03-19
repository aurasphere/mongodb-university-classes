# Problem
Now let's connect to the cluster we deployed in an earlier lab. First we will need to whitelist the ip of the computer from which you will connect to the cluster.

<img src="https://s3.amazonaws.com/edu-static.mongodb.com/lessons/M123/whitelist-ip.png"/>

Once you have whitelisted your ip address, return to the "Clusters" tab and click the "CONNECT" button for your cluster.

<img src="https://s3.amazonaws.com/edu-static.mongodb.com/lessons/M123/cluster-connect.png"/>

Before you attempt to connect to your cluster, please ensure that you have installed and are set up to use MongoDB 3.2.6 or greater. You will need MongoDB 3.2.6+ with support for TLS/SSL. Note that for some operating systems (e.g., OS X), we distribute versions of 3.2.6+ that do not include TLS/SSL support. The easiest way to ensure you have TLS/SSL support is to install MongoDB Enterprise. See the MongoDB documentation for instructions on installing MongoDB Enterprise for your operating system.

We will use both the mongo shell and mongoimport in this course. Make sure you can run both of those binaries.

Once you have MongoDB 3.2.6+ installed, we can connect to our cluster. To connect, use the connection string provided by Atlas. You will need to replace PASSWORD in this string with the password for the admin user you created when you built your cluster.

<img src="https://s3.amazonaws.com/edu-static.mongodb.com/lessons/M123/cluster-connect-modal.png"/>

Once you have successfully connected, you should see a mongo shell prompt that matches the following template.

    xxxx-xxx-xxxxx-x:XXXXXXX>

Please copy and paste the complete text of the prompt into the box below and submit. If you have created your cluster following the instructions above, your submission should be marked correct. If your answer is not correct, please do not exhaust your allowed attempts guessing. Instead, please visit the class discussion forum for help.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>m123-rs1-shard-0:PRIMARY></li>
	</ul>
</details>
