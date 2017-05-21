# Problem
Given the following audit filter:

    {
      "$or": [
        {
          "atype": "authCheck",
          "param.command": {
            "$in": [
              "find",
              "insert",
              "delete",
              "update",
              "findandmodify"
            ]
          }
        },
        {
          "atype": {
            "$in": [
              "createCollection",
              "dropCollection"
            ]
          }
        }
      ]
    }
	
Which of the following commands would be logged by this audit filter?

Note: You can assume that auditAuthorizationSuccess is set to true.

Check all that apply:
 - show dbs
 - db.products.insert({product: 'Amplifier'})
 - db.products.insertOne({product: 'Basket'})
 - db.products.find({product: 'Candle'})
 - db.products.findOne({product: 'Door Hinge'})

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>db.products.insert({product: 'Amplifier'})</li>
      <li>db.products.insertOne({product: 'Basket'})</li>
      <li>db.products.find({product: 'Candle'})</li>
      <li>db.products.findOne({product: 'Door Hinge'})</li>
	</ul>
</details>