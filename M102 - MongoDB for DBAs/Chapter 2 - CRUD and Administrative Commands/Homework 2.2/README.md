# Problem
Add a new product to the products collection of this form:

    {
        "_id" : "ac9",
        "name" : "AC9 Phone",
        "brand" : "ACME",
        "type" : "phone",
        "price" : 333,
        "warranty_years" : 0.25,
        "available" : true
    }
	
Note: in general because of the automatic line continuation in the shell, you can cut/paste in the above and shouldn't have to type it all out. Just enclose it in the proper statement(s) to get it added.

Next, load into a shell variable the object corresponding to

    _id : ObjectId("507d95d5719dbef170f15c00")

 - Then change term_years to 3 for that document. (And update it in the database.)
 - Then change over_rate for sms in limits to 0.01 from 0. Update that too.

At the shell prompt type:

    homework.b()

What is the output?

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>0.050.019031</li>
	</ul>
</details>