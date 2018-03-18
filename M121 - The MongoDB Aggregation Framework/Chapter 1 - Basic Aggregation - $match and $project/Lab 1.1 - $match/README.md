# Problem
Download Handouts:
 - <a href="https://s3.amazonaws.com/edu-downloads.10gen.com/M121_2018_March/static/handouts/m121/chapter1.zip">m121/chapter1.zip</a>
 
Help MongoDB pick a movie our next movie night! Based on employee polling, we've decided that potential movies must meet the following criteria.

 - imdb.rating is at least 7
 - genres does not contain "Crime" or "Horror"
 - rated is either "PG" or "G"
 - languages contains "English" and "Japanese"

Assign the aggregation to a variable named pipeline, like:

    var pipeline = [ { $match: { ... } } ]

 - As a hint, your aggregation should return 23 documents. You can verify this by typing 

       db.movies.aggregate(pipeline).itcount()

 - Load validateLab1.js into mongo shell

       load('validateLab1.js')

 - And run the validateLab1 validation method

       validateLab1(pipeline)

What is the answer?

Choose the best answer:
 - 15
 - 30
 - 12
 - 7

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>15</li>
	</ul>
</details>
