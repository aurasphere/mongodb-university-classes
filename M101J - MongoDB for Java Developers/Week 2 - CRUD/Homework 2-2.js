/*
 * MIT License
 * 
 * Copyright (c) 2017 Donato Rimenti
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */ 
 
/*
 * In this problem, you will be using a collection of student scores that is
 * similar to what we used in the lessons. Please download grades.json from the
 * Download Handout link and import it into your local mongo database as
 * follows:
 * 
 * mongoimport --drop -d students -c grades grades.json 
 * The dataset contains 4 scores for 200 students.
 * 
 * First, let's confirm your data is intact; the number of documents should be
 * 800.
 * 
 * use students db.grades.count() 
 * You should get 800.
 * 
 * This next query, which uses the aggregation framework that we have not taught
 * yet, will tell you the student_id with the highest average score:
 * 
 * db.grades.aggregate({'$group':{'_id':'$student_id',
 * 'average':{$avg:'$score'}}}, {'$sort':{'average':-1}}, {'$limit':1}) 
 *
 * The answer should be student_id 164 with an average of approximately 89.3.
 * 
 * Now it's your turn to analyze the data set. Find all exam scores greater than
 * or equal to 65, and sort those scores from lowest to highest.
 * 
 * What is the student_id of the lowest exam score above 65?
 */
 
 // Gets the DB.
var db = db.getSiblingDB('students');

// Checks for DB integrity.
var gradesCount = db.grades.count();
print("Grades count for DB integrity check (you should get 800) : " + gradesCount);

var cursor = db.grades.aggregate(
									{'$group':
												{
												'_id' : '$student_id', 
												'average' : { $avg : '$score' }
												}
									}, 
									{
										'$sort' : { 'average' : -1 }
									}, 
									{ '$limit' : 1 }
								);
print("Student with the highest average score (should have student_id 164 " +
	"with an average of approximately 89.3.) : ");
while(cursor.hasNext()){
	printjson();
}

// Performs the query. Finds the scores greater than 65, sorts them by score and
// shows only the first result.
cursor = db.grades.find( 
								{ score : { $gte : 65 } }
							)
						.sort(
								{ score : 1 }
							)
						.limit(1);

// Prints the result.
print("Solution : ");
while(cursor.hasNext()){
	printjson(cursor.next());
}