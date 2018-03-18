# Problem
Our movies dataset has a lot of different documents, some with more convoluted titles than others. If we'd like to analyze our collection to find movie titles that are composed of only one word, we could fetch all the movies in the dataset and do some processing in a client application, but the Aggregation Framework allows us to do this on the server!

Using the Aggregation Framework, find a count of the number of movies that have a title composed of one word. To clarify, "Cinderella" and "3-25" should count, where as "Cast Away" would not.

Make sure you look into the <a href="https://docs.mongodb.com/manual/meta/aggregation-quick-reference/?_ga=2.147148532.274874957.1521323573-1817012061.1521323573#string-expressions">$split String expression</a> and the <a href="https://docs.mongodb.com/manual/meta/aggregation-quick-reference/?_ga=2.146172535.274874957.1521323573-1817012061.1521323573#array-expressions">$size Array expression</a>

To get the count, you can append itcount() to the end of your pipeline

    db.movies.aggregate([...]).itcount()

Choose the best answer:
 - 9447
 - 144
 - 8068
 - 12373

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>8068</li>
	</ul>
</details>