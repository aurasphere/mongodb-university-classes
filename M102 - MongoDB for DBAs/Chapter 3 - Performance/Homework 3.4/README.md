# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M102_October/handouts/performance__m102_performance_reorg_537a56c08bb48b7c467a20d3.zip">performance__m102_performance_reorg_537a56c08bb48b7c467a20d3.zip</a>

Start a mongod server instance (if you still have a replica set, that would work too).

Next, download the handout and run:

    mongo --shell localhost/performance performance.js
    homework.init()

Build an index on the "active" and "tstamp" fields. You can verify that you've done your job with

    db.sensor_readings.getIndexes()

When you are done, run:

    homework.a()

and enter the numeric result below (no spaces).

Note: if you would like to try different indexes, you can use db.sensor_readings.dropIndexes() to drop your old index before creating a new one. (For this problem you will only need one index beyond the _id index which is present by default.)

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>6</li>
	</ul>
</details>