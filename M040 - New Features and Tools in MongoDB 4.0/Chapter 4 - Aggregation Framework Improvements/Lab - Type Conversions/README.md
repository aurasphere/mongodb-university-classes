### Chapter 4: Aggregation Framework Improvements
# Lab: Type Conversions

## Problem:

In this lab we will be dealing with an IoT sample dataset about turnstile information for the London Underground. This dataset represents one turnstile's sensor data collectd over the course of a month.

The [sensor_data.json](https://s3.amazonaws.com/edu-downloads.10gen.com/M040_2018_ondemand_v1/static/handouts/m040/aggregation/sensor_data.json) file contains the sample dataset.

Go ahead and import this data into MongoDB

### - VAGRANT ONLY

    vagrant ssh
    mongoimport --host M040/$(hostname):27017,$(hostname):27027,$(hostname):27037 -d sensor -c data < /shared/sensor_data.json

### - LOCAL

    cd ~/university/m040
    # adjust the host parameter to reflect your system hostname
    mongoimport --host M040/$(hostname):27017,$(hostname):27027,$(hostname):27037 -d sensor -c data < /shared/sensor_data.json

You can visualize the different schema variations using MongoDB Compass Schema tab. It should be very similar to the following:

<img src="https://s3.amazonaws.com/edu-static.mongodb.com/lessons/M040/aggregation_sensor_data.png"/>

If you deployed the M040 replica set using this course vagrant environment you can connect to the virtual machine using the ip address 192.168.40.100 from MongoDB Compass, running on your local machine.

Here we can see that the count field has some varying data types.

 - count can be of one of the types: string, double, int32, or undefined

It appears our sensors are sending erroneous data in some cases. We'd like a sum of all count values. Ignore any error values. Be sure to convert to an integer.

What is the sum total of the count information?

The following aggregation has been provided to give you a start.

    db.data.aggregate([
      {
        "$unwind": "$turnstile"
      },
      {
        "$group": {
          "_id": 0,
          "sum": {
            "$sum": {
            <your code here!!>
            }
          }
        }
      }
    ])

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>281245</li>
    </ul>
</details>