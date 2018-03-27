# Problem
Consider the following aggregation pipelines:

 - Pipeline 1
        db.coll.aggregate([
          {"$match": {"field_a": {"$gt": 1983}}},
          {"$project": { "field_a": "$field_a.1", "field_b": 1, "field_c": 1  }},
          {"$replaceRoot":{"newRoot": {"_id": "$field_c", "field_b": "$field_b"}}},
          {"$out": "coll2"},
          {"$match": {"_id.field_f": {"$gt": 1}}},
          {"$replaceRoot":{"newRoot": {"_id": "$field_b", "field_c": "$_id"}}}
        ])
		
 - Pipeline 2
        db.coll.aggregate([
          {"$match": {"field_a": {"$gt": 111}}},
          {"$geoNear": {
            "near": { "type": "Point", "coordinates": [ -73.99279 , 40.719296 ] },
            "distanceField": "distance"}},
          {"$project": { "distance": "$distance", "name": 1, "_id": 0  }}
        ])

 - Pipeline 3
        db.coll.aggregate([
          {
            "$facet": {
              "averageCount": [
                {"$unwind": "$array_field"},
                {"$group": {"_id": "$array_field", "count": {"$sum": 1}}}
              ],
              "categorized": [{"$sortByCount": "$arrayField"}]
            },
          },
          {
            "$facet": {
              "new_shape": [{"$project": {"range": "$categorized._id"}}],
              "stats": [{"$match": {"range": 1}}, {"$indexStats": {}}]
            }
          }
        ])
		
Which of the following statements are correct?

Check all that apply:
 - Pipeline 3 executes correctly
 - Pipeline 2 fails because we cannot project distance field
 - Pipeline 2 is incorrect because $geoNear needs to be the first stage of our pipeline
 - Pipeline 3 fails because $indexStats must be the first stage in a pipeline and may not be used within a $facet
 - Pipeline 1 fails since $out is required to be the last stage of the pipeline
 - Pipeline 1 is incorrect because you can only have one $replaceRoot stage in your pipeline
 - Pipeline 3 fails since you can only have one $facet stage per pipeline

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>Pipeline 2 is incorrect because $geoNear needs to be the first stage of our pipeline</li>
	  <li>Pipeline 3 fails because $indexStats must be the first stage in a pipeline and may not be used within a $facet</li>
	  <li>Pipeline 1 fails since $out is required to be the last stage of the pipeline</li>
    </ul>
</details>