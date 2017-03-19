# Problem
In this lab you're going to examine several example queries and determine which compound index will best service them.

    > db.people.find({
        "address.state": "Nebraska",
        "last_name": /^G/,
        "job": "Police officer"
      })
	  
    > db.people.find({
        "job": /^P/,
        "first_name": /^C/,
        "address.state": "Indiana"
      }).sort({ "last_name": 1 })
	  
    > db.people.find({
        "address.state": "Connecticut",
        "birthday": {
          "$gte": ISODate("2010-01-01T00:00:00.000Z"),
          "$lt": ISODate("2011-01-01T00:00:00.000Z")
        }
      })
	  
If you had to build one index on the people collection, which of the following indexes would best sevice all 3 queries?

Choose the best answer:
 - { "address.state": 1, "job": 1 }
 - { "address.state": 1, "job": 1, "first_name": 1 }
 - { "address.state": 1, "last_name": 1, "job": 1 }
 - { "job": 1, "address.state": 1 }
 - { "job": 1, "address.state": 1, "first_name": 1 }
 - { "job": 1, "address.state": 1, "last_name": 1 }

<details>
  <summary>Click here for the solution</summary>
  - { "address.state": 1, "last_name": 1, "job": 1 }
</details>