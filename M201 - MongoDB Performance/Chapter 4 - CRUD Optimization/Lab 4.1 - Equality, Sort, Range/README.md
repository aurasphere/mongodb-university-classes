# Problem
In this lab you're going to use the equality, sort, range rule to determine which index best supports a given query.

Given the following query:

    db.accounts.find( { accountBalance : { $gte : NumberDecimal(100000.00) } }, city: "New York" )
               .sort( { lastName: 1, firstName: 1 } )
			   
Which of the following indexes best supports this query with regards to the equality, sort, range rule.

Choose the best answer:
 - { lastName: 1, firstName: 1, city: 1, accountBalance: 1 }
 - { accountBalance: 1, city: 1, lastName: 1, firstName: 1 }
 - { city: 1, lastName: 1, firstName: 1, accountBalance: 1 }
 - { lastName: 1, firstName: 1, accountBalance: 1, city: 1 }

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{ city: 1, lastName: 1, firstName: 1, accountBalance: 1 }</li>
	</ul>
</details>