# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M102_October/handouts/Homework2__hw2.1_m102_529fe537e2d42347509fb412.js">Homework2__hw2.1_m102_529fe537e2d42347509fb412.js</a> 
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M102_October/handouts/Products__hw1.2_m102_529e39a8e2d42347509fb3f0.json">Products__hw1.2_m102_529e39a8e2d42347509fb3f0.json</a> 

We will use the pcat.products collection from week 1. So start with that; if not already set up, import it:

    mongoimport --drop -d pcat -c products products.json
	
You can find products.json from the Download Handouts link.

In the shell, go to the pcat database. If you type:

    use pcat;
    db.products.count()

the shell should return 11.

Next, download homework2.js from the Download Handouts link. Run the shell with this script:

    mongo --shell pcat homework2.js
	
First, make a mini-backup of the collection before we start modifying it. In the shell:

    b = db.products_bak; db.products.find().forEach( function(o){ b.insert(o) } )
    // check it worked:
    b.count()
    // should print 11
	
If you have any issues you can restore from "products_bak"; or, you can re-import with mongoimport. (You would perhaps need in that situation to empty the collection first or drop it; see the --drop option on mongoimport --help.)

In the shell, type:

    homework.a()
	
What is the output? (The above will check that products_bak is populated.)

Enter answer here:

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>3.05</li>
	</ul>
</details>