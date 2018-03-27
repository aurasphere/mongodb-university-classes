# Problem
Consider the following people collection and this sample document:

    db.people.findOne()
    {
    "_id": 0,
    "name": "Iva Estrada",
    "age": 95,
    "state": "WA",
    "phone": "(739) 557-2576",
    "ssn": "901-34-4492"
    }

The collection also has these indexes:

    db.people.getIndexes()
    [
    {
      "v": 2,
      "key": {
        "_id": 1
      },
      "name": "_id_",
      "ns": "test.people"
    },
    {
      "v": 2,
      "key": {
        "name": 1
      },
      "name": "name_1",
      "ns": "test.people"
    },
    {
      "v": 2,
      "key": {
        "state": 1
      },
      "name": "state_1",
      "ns": "test.people"
    }
    ]

If we would like to calculate the average age of all people in the collection by state, sorted by state, we could run the following aggregation pipeline:

    var pipeline = [
        {"$project": { "state": 1, "name": 1, "age": 1}},
        {"$group" : { "_id": "$state", "avg_age": {"$avg": "$age"}}},
        {"$sort": {"_id": 1}}
      ]
    db.people.aggregate(pipeline)

However, this pipeline execution can be optimized!

Which of the following options will improve the execution of this aggregation pipeline?

Choose the best answer:
 - var pipeline = [ {"$group" : { "_id": "$state", "total": {"$sum": "$age"}, "n": {"$sum":1}}}, {"$project": { "_id": 1, "avg_age": { "$divide": ["$toal", "$n"] }}}, {"$sort": {"_id": 1}} ]
 - var pipeline = [ {"$sort": {"state": 1}}, {"$project": { "state": 1, "name": 1, "age": 1}}, {"$group" : { "_id": "$state", "avg_age": {"$avg": "$age"}}}, ]
 - var pipeline = [ {"$project": { "state": 1, "name": 1, "age": 1, "_id":0}}, {"$group" : { "_id": "$state", "avg_age": {"$avg": "$age"}}}, {"$sort": {"_id": 1}} ]

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>var pipeline = [ {"$sort": {"state": 1}}, {"$project": { "state": 1, "name": 1, "age": 1}}, {"$group" : { "_id": "$state", "avg_age": {"$avg": "$age"}}}, ]</li>
    </ul>
</details>