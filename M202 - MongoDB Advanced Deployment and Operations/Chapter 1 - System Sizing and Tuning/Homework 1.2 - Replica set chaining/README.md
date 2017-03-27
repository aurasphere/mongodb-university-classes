# Problem
You are operating a geographically dispersed replica set as outlined below:

<img src="https://s3.amazonaws.com/edu-static.mongodb.com/lessons/m202/chapter+2/replica_set_chaining.png"/>

Your network operations team has asked if you can limit the amount of outbound traffic from Site A because of some capacity issues with the traffic in and out of that site. For example, consider that this is where the majority of your users stream/download. However, due to how the application is deployed, you wish to keep your write traffic in Site A for performance, and so you have chosen not to change which server is primary.

Using replica set chaining, which of the following scenarios will minimize traffic due to MongoDB replication in and out of Site A?

Note: It will probably help you to draw each of the choices below for yourself as you think through them.

Choose the best answer:
 - P to S1; P to S2; P to S3; P to S4 (All secondaries replicate from the primary.)
 - P to S1; S1 to S2; S2 to S3; S3 to S4
 - P to S2; S2 to S1; S2 to S3; S3 to S4
 - P to S1; S1 to S2; S2 to S3; S1 to S4

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>P to S1; S1 to S2; S2 to S3; S3 to S4</li>
	</ul>
</details>