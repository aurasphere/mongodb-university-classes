# Problem
Download Handouts:
 - <a href="https://university.mongodb.com/static/MongoDB_2017_M101J_January/handouts/grades.ef42a2b3e7ff.json">grades.json</a>

In this problem, you will be using a collection of student scores that is similar to what we used in the lessons. Please download grades.json from the Download Handout link and import it into your local mongo database as follows:

    mongoimport --drop -d students -c grades grades.json

The dataset contains 4 scores for 200 students.

First, let's confirm your data is intact; the number of documents should be 800.

    use students
    db.grades.count()

You should get 800.

This next query, which uses the aggregation framework that we have not taught yet, will tell you the student_id with the highest average score:

    db.grades.aggregate({'$group':{'_id':'$student_id', 'average':{$avg:'$score'}}}, {'$sort':{'average':-1}}, {'$limit':1})

The answer should be student_id 164 with an average of approximately 89.3.

Now it's your turn to analyze the data set. Find all exam scores greater than or equal to 65, and sort those scores from lowest to highest.

What is the student_id of the lowest exam score above 65?

Choose the best answer:
 - 115
 - 22
 - 48
 - 67
 - 87
 - 114
 
<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>22</li>
	</ul>
</details>