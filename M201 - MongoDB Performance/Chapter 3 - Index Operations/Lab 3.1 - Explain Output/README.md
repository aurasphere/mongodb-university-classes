# Problem
In this lab you're going to determine which index was used to satisfy a query given its explain output.

The following query was ran:

    > var exp = db.restaurants.explain("executionStats")
    > exp.find({ "address.state": "NY", stars: { $gt: 3, $lt: 4 } }).sort({ name: 1 }).hint(REDACTED)

Which resulted in the following output:

    {
      "queryPlanner": {
        "plannerVersion": 1,
        "namespace": "m201.restaurants",
        "indexFilterSet": false,
        "parsedQuery": "REDACTED",
        "winningPlan": {
          "stage": "SORT",
          "sortPattern": {
            "name": 1
          },
          "inputStage": {
            "stage": "SORT_KEY_GENERATOR",
            "inputStage": {
              "stage": "FETCH",
              "inputStage": {
                "stage": "IXSCAN",
                "keyPattern": "REDACTED",
                "indexName": "REDACTED",
                "isMultiKey": false,
                "isUnique": false,
                "isSparse": false,
                "isPartial": false,
                "indexVersion": 1,
                "direction": "forward",
                "indexBounds": "REDACTED"
              }
            }
          }
        },
        "rejectedPlans": [ ]
      },
      "executionStats": {
        "executionSuccess": true,
        "nReturned": 3335,
        "executionTimeMillis": 20,
        "totalKeysExamined": 3335,
        "totalDocsExamined": 3335,
        "executionStages": "REDACTED"
      },
      "serverInfo": "REDACTED",
      "ok": 1
    }
	
Given the redacted explain output above, select the index that was passed to hint.

Note: The hint() method is used to force the query planner to select a particular index for a given query. You can learn more about hint by visiting its documentation.

Choose the best answer:
 - { "address.state": 1, "name": 1, "stars": 1 }
 - { "address.state": 1, "stars": 1, "name": 1 }
 - { "address.state": 1, "name": 1 }
 - { "address.state": 1 }

<details>
  <summary>Click here for the solution</summary>
  - { "address.state": 1, "stars": 1, "name": 1 }
</details>