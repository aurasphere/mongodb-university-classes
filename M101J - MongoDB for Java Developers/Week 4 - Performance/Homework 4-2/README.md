#Problem
Suppose you have a collection called tweets whose documents contain information about the created_at time of the tweet and the user's followers_count at the time they issued the tweet. What can you infer from the following explain output?

    > db.tweets.explain("executionStats").find( { "user.followers_count" : { $gt : 1000 } } ).limit(10).skip(5000).sort( { created_at : 1 } )
    {
        "queryPlanner" : {
            "plannerVersion" : 1,
            "namespace" : "twitter.tweets",
            "indexFilterSet" : false,
            "parsedQuery" : {
                "user.followers_count" : {
                    "$gt" : 1000
                }
            },
            "winningPlan" : {
                "stage" : "LIMIT",
                "limitAmount" : 0,
                "inputStage" : {
                    "stage" : "SKIP",
                    "skipAmount" : 0,
                    "inputStage" : {
                        "stage" : "FETCH",
                        "filter" : {
                            "user.followers_count" : {
                                "$gt" : 1000
                            }
                        },
                        "inputStage" : {
                            "stage" : "IXSCAN",
                            "keyPattern" : {
                                "created_at" : -1
                            },
                            "indexName" : "created_at_-1",
                            "isMultiKey" : false,
                            "direction" : "backward",
                            "indexBounds" : {
                                "created_at" : [
                                    "[MinKey, MaxKey]"
                                ]
                            }
                        }
                    }
                }
            },
            "rejectedPlans" : [ ]
        },
        "executionStats" : {
            "executionSuccess" : true,
            "nReturned" : 10,
            "executionTimeMillis" : 563,
            "totalKeysExamined" : 251120,
            "totalDocsExamined" : 251120,
            "executionStages" : {
                "stage" : "LIMIT",
                "nReturned" : 10,
                "executionTimeMillisEstimate" : 500,
                "works" : 251121,
                "advanced" : 10,
                "needTime" : 251110,
                "needFetch" : 0,
                "saveState" : 1961,
                "restoreState" : 1961,
                "isEOF" : 1,
                "invalidates" : 0,
                "limitAmount" : 0,
                "inputStage" : {
                    "stage" : "SKIP",
                    "nReturned" : 10,
                    "executionTimeMillisEstimate" : 500,
                    "works" : 251120,
                    "advanced" : 10,
                    "needTime" : 251110,
                    "needFetch" : 0,
                    "saveState" : 1961,
                    "restoreState" : 1961,
                    "isEOF" : 0,
                    "invalidates" : 0,
                    "skipAmount" : 0,
                    "inputStage" : {
                        "stage" : "FETCH",
                        "filter" : {
                            "user.followers_count" : {
                                "$gt" : 1000
                            }
                        },
                        "nReturned" : 5010,
                        "executionTimeMillisEstimate" : 490,
                        "works" : 251120,
                        "advanced" : 5010,
                        "needTime" : 246110,
                        "needFetch" : 0,
                        "saveState" : 1961,
                        "restoreState" : 1961,
                        "isEOF" : 0,
                        "invalidates" : 0,
                        "docsExamined" : 251120,
                        "alreadyHasObj" : 0,
                        "inputStage" : {
                            "stage" : "IXSCAN",
                            "nReturned" : 251120,
                            "executionTimeMillisEstimate" : 100,
                            "works" : 251120,
                            "advanced" : 251120,
                            "needTime" : 0,
                            "needFetch" : 0,
                            "saveState" : 1961,
                            "restoreState" : 1961,
                            "isEOF" : 0,
                            "invalidates" : 0,
                            "keyPattern" : {
                                "created_at" : -1
                            },
                            "indexName" : "created_at_-1",
                            "isMultiKey" : false,
                            "direction" : "backward",
                            "indexBounds" : {
                                "created_at" : [
                                    "[MinKey, MaxKey]"
                                ]
                            },
                            "keysExamined" : 251120,
                            "dupsTested" : 0,
                            "dupsDropped" : 0,
                            "seenInvalidated" : 0,
                            "matchTested" : 0
                        }
                    }
                }
            }
        },
        "serverInfo" : {
            "host" : "generic-name.local",
            "port" : 27017,
            "version" : "3.0.1",
            "gitVersion" : "534b5a3f9d10f00cd27737fbcd951032248b5952"
        },
        "ok" : 1
    }
	
Check all that apply:
 - The query uses an index to determine the order in which to return result documents.
 - The query uses an index to determine which documents match.
 - The query returns 251120 documents.
 - The query examines 251120 documents.
 - The query is a covered query.
 
<details>
  <summary>Click here for the solution</summary>
  - The query uses an index to determine the order in which to return result documents.
  - The query examines 251120 documents.
</details>