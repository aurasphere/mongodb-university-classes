# Problem
Let's find how many movies in our movies collection are a "labor of love", where the same person appears in cast, directors, and writers

To get a count after you have defined your pipeline, there are two simple methods.

    // add the $count stage to the end of your pipeline
    // you will learn about this stage shortly!
    db.movies.aggregate([
      {$stage1},
      {$stage2},
      ...$stageN,
      { $count: "labors of love" }
    ])
    
    // or use itcount()
    db.movies.aggregate([
      {$stage1},
      {$stage2},
      {...$stageN},
    ]).itcount()

How many movies are "labors of love"?

Choose the best answer:

 - 1595
 - 1263
 - 1597
 - 1259

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>1597</li>
	</ul>
</details>