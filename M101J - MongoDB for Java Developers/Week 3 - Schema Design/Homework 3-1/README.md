# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M101J_January/handouts/students.e7ed0a289cbe.json">students.json</a>

Download the students.json file from the Download Handout link and import it into your local Mongo instance with this command:

    mongoimport --drop -d school -c students students.json

This dataset holds the same type of data as last week's grade collection, but it's modeled differently. You might want to start by inspecting it in the Mongo shell.

Write a program in the language of your choice that will remove the lowest homework score for each student. Since there is a single document for each student containing an array of scores, you will need to update the scores array and remove the homework.

Remember, just remove a homework score. Don't remove a quiz or an exam!

Hint/spoiler: With the new schema, this problem is a lot harder and that is sort of the point. One way is to find the lowest homework in code and then update the scores array with the low homework pruned.

To confirm you are on the right track, here are some queries to run after you process the data with the correct answer shown:

Let us count the number of students we have:

    use school
    db.students.count()

The answer will be 200.

Let's see what Tamika Schildgen's record looks like once you have removed the lowest score:

    db.students.find( { _id : 137 } ).pretty( )

This should be the output:

    {
        "_id" : 137,
        "name" : "Tamika Schildgen",
        "scores" : [
            {
                "type" : "exam",
                "score" : 4.433956226109692
            },
            {
                "type" : "quiz",
                "score" : 65.50313785402548
            },
            {
                "type" : "homework",
                "score" : 89.5950384993947
            }
        ]
    }
	
To verify that you have completed this task correctly, provide the identity (in the form of their _id) of the student with the highest average in the class with following query that uses the aggregation framework. The answer will appear in the _id field of the resulting document.

    db.students.aggregate( [
      { '$unwind': '$scores' },
      {
        '$group':
        {
          '_id': '$_id',
          'average': { $avg: '$scores.score' }
        }
      },
      { '$sort': { 'average' : -1 } },
      { '$limit': 1 } ] )

<details>
  <summary>Click here for the solution</summary>
  - 13
</details>