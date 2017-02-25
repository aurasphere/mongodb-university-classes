#Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M101J_January/handouts/sysprofile.acfbb9617420.json">sysprofile.json</a>

In this problem you will analyze a profile log taken from a different mongoDB instance and you will import it into a collection named sysprofile. To start, please download sysprofile.json from Download Handout link and import it with the following command:

    mongoimport --drop -d m101 -c sysprofile sysprofile.json

Now query the profile data, looking for all queries to the students collection in the database school2, sorted in order of decreasing latency. What is the latency of the longest running operation to the collection, in milliseconds?

Choose the best answer:
 - 19776550
 - 10000000
 - 5580001
 - 15820
 - 2350

<details>
  <summary>Click here for the solution</summary>
  - 15820
</details>