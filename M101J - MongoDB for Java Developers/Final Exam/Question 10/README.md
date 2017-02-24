#Problem
##Understanding the output of explain

We perform the following query on the enron dataset:

    var exp = db.messages.explain('executionStats')

    exp.find( { 'headers.Date' : { '$gt' : new Date(2001,3,1) } }, { 'headers.From' : 1, '_id' : 0 } ).sort( { 'headers.From' : 1 } )

and get the following explain output.

    {
      "queryPlanner" : {
        "plannerVersion" : 1,
        "namespace" : "enron.messages",
        "indexFilterSet" : false,
        "parsedQuery" : {
          "headers.Date" : {
            "$gt" : ISODate("2001-04-01T05:00:00Z")
          }
        },
        "winningPlan" : {
          "stage" : "PROJECTION",
          "transformBy" : {
            "headers.From" : 1,
            "_id" : 0
          },
          "inputStage" : {
            "stage" : "FETCH",
            "filter" : {
              "headers.Date" : {
                "$gt" : ISODate("2001-04-01T05:00:00Z")
              }
            },
            "inputStage" : {
              "stage" : "IXSCAN",
              "keyPattern" : {
                "headers.From" : 1
              },
              "indexName" : "headers.From_1",
              "isMultiKey" : false,
              "direction" : "forward",
              "indexBounds" : {
                "headers.From" : [
                  "[MinKey, MaxKey]"
                ]
              }
            }
          }
        },
        "rejectedPlans" : [ ]
      },
      "executionStats" : {
        "executionSuccess" : true,
        "nReturned" : 83057,
        "executionTimeMillis" : 726,
        "totalKeysExamined" : 120477,
        "totalDocsExamined" : 120477,
        "executionStages" : {
          "stage" : "PROJECTION",
          "nReturned" : 83057,
          "executionTimeMillisEstimate" : 690,
          "works" : 120478,
          "advanced" : 83057,
          "needTime" : 37420,
          "needFetch" : 0,
          "saveState" : 941,
          "restoreState" : 941,
          "isEOF" : 1,
          "invalidates" : 0,
          "transformBy" : {
            "headers.From" : 1,
            "_id" : 0
          },
          "inputStage" : {
            "stage" : "FETCH",
            "filter" : {
              "headers.Date" : {
                "$gt" : ISODate("2001-04-01T05:00:00Z")
              }
            },
            "nReturned" : 83057,
            "executionTimeMillisEstimate" : 350,
            "works" : 120478,
            "advanced" : 83057,
            "needTime" : 37420,
            "needFetch" : 0,
            "saveState" : 941,
            "restoreState" : 941,
            "isEOF" : 1,
            "invalidates" : 0,
            "docsExamined" : 120477,
            "alreadyHasObj" : 0,
            "inputStage" : {
              "stage" : "IXSCAN",
              "nReturned" : 120477,
              "executionTimeMillisEstimate" : 60,
              "works" : 120477,
              "advanced" : 120477,
              "needTime" : 0,
              "needFetch" : 0,
              "saveState" : 941,
              "restoreState" : 941,
              "isEOF" : 1,
              "invalidates" : 0,
              "keyPattern" : {
                "headers.From" : 1
              },
              "indexName" : "headers.From_1",
              "isMultiKey" : false,
              "direction" : "forward",
              "indexBounds" : {
                "headers.From" : [
                  "[MinKey, MaxKey]"
                ]
              },
              "keysExamined" : 120477,
              "dupsTested" : 0,
              "dupsDropped" : 0,
              "seenInvalidated" : 0,
              "matchTested" : 0
            }
          }
        }
      },
      "serverInfo" : {
        "host" : "dpercy-mac-air.local",
        "port" : 27017,
        "version" : "3.0.1",
        "gitVersion" : "534b5a3f9d10f00cd27737fbcd951032248b5952"
      },
      "ok" : 1
    }

Check below all the statements that are true about the way MongoDB handled this query.

Check all that apply:
 - The query used an index to figure out which documents match the find criteria.
 - The query avoided sorting the documents because it was able to use an index's ordering.
 - The query returned 120,477 documents.
 - The query scanned every document in the collection.

<details>
  <summary>Click here for the solution</summary>
  - The query avoided sorting the documents because it was able to use an index's ordering.
  - The query scanned every document in the collection.
</details>