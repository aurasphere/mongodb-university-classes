# Problem
At this point you should have pcat.products loaded from the previous step. You can confirm this by running in the shell:

    db.products.find()
    // or:
    db.products.count()
    // should print out "11"

Now, what query would you run to get all the products where brand equals the string "ACME"?

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>db.products.find({brand:"ACME"})</li>
	</ul>
</details>