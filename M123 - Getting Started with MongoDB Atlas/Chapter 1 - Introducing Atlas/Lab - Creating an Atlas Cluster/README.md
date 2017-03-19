#Problem
In this lab, we will create our first cluster in Atlas.

From the "Clusters" tab, click "BUILD A NEW CLUSTER" to get started.

<img src="https://s3.amazonaws.com/edu-static.mongodb.com/lessons/M123/no-clusters-yet.png"/>

Using what you've learned so far, create a 3-node replica set as follows:

Name your cluster m123-rs1.
Select us-west-2 (Oregon) as the AWS region.
Use M10s with the default settings as the instance size.
In creating your cluster, please take care to specify an admin username and password. Note that the fields for the admin user are at the very bottom of the "Build Cluster" modal.

<img src="https://s3.amazonaws.com/edu-static.mongodb.com/lessons/M123/build-cluster-admin-user.png"/>

Once you have specified all the requested settings, please click the "CONTINUE TO PAYMENT" button. Please note that you will be required to enter credit card information on the following page.

Apply code goatlas10 while deploying your this first cluster to unlock 10 USD in free credits.

The total cost to you for the clusters we ask you to create in this course should be less than 5 USD.

<img src="https://s3.amazonaws.com/edu-static.mongodb.com/lessons/M123/payment-information.png"/>

After you have entered payment information, click "CONFIRM & DEPLOY". It will take five minutes or more for your cluster to become available. While it is being created you will see a blue dotted line around the cluster.

<img src="https://s3.amazonaws.com/edu-static.mongodb.com/lessons/M123/replica-set-deploying.png"/>

Once the cluster is fully deployed, click the "CONNECT" button for your cluster.

<img src="https://s3.amazonaws.com/edu-static.mongodb.com/lessons/M123/cluster-connect.png" />

In the modal that appears, you will see a connection string for accessing to your cluster from the mongo shell.

<img src="https://s3.amazonaws.com/edu-static.mongodb.com/lessons/M123/cluster-connect-modal.png" />

We're not going to connect just yet. We'll do that in a later lab. For now, we'll just ask you to validate that you successfully created a cluster. Either copy and paste the connection string somewhere so that you can view the entire string or scroll to the right to visually scan through it.

Which of the following command line parameters are present in the connection string?

Check all that apply:
 - --host
 - --port
 - --username
 - --password
 - --ssl

<details>
  <summary>Click here for the solution</summary>
  - --username
  - --password
  - --ssl
</details>
