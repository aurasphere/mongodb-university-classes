#Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M101J_January/handouts/small_zips.28ecb7fb8fba.json">small_zips.json</a>

*Crunching the Zipcode dataset*
Please calculate the average population of cities in California (abbreviation CA) and New York (NY) (taken together) with populations over 25,000.
For this problem, assume that a city name that appears in more than one state represents two separate cities.
Please round the answer to a whole number.
Hint: The answer for CT and NJ (using this data set) is 38177.
Please note:
 - Different states might have the same city name.
 - A city might have multiple zip codes.

For this problem, we have used a subset of the data you previously used in zips.json, not the full set. For this set, there are only 200 documents (and 200 zip codes), and all of them are in New York, Connecticut, New Jersey, and California.
You can download the handout and perform your analysis on your machine with

    mongoimport --drop -d test -c zips small_zips.json

Note

This is raw data from the United States Postal Service. If you notice that while importing, there are a few duplicates fear not, this is expected and will not affect your answer.


Once you've generated your aggregation query and found your answer, select it from the choices below.
Please use the Aggregation pipeline to solve this problem.

Choose the best answer:
 - 44805
 - 55921
 - 67935
 - 71819
 - 82426
 - 93777

<details>
  <summary>Click here for the solution</summary>
  - 44805
</details>