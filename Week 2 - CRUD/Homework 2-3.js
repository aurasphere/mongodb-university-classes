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
 * Write a program in the language of your choice that will remove the grade of
 * type "homework" with the lowest score for each student from the dataset in
 * the handout. Since each document is one grade, it should remove one document
 * per student. This will use the same data set as the last problem, but if you
 * don't have it, you can download and re-import.
 * 
 * The dataset contains 4 scores each for 200 students.
 * 
 * First, let's confirm your data is intact; the number of documents should be
 * 800.
 * 
 * use students db.grades.count() 
 * Hint/spoiler: If you select homework grade-documents, sort by student and
 * then by score, you can iterate through and find the lowest score for each 
 * student by noticing a change in student id. As you notice that change of 
 * student_id, remove the document.
 * 
 * To confirm you are on the right track, here are some queries to run after you
 * process the data and put it into the grades collection:
 * 
 * Let us count the number of grades we have:
 * 
 * db.grades.count()
 * 
 * The result should be 600. Now let us find the student who holds the 101st 
 * best grade across all grades:
 * 
 * db.grades.find().sort( { 'score' : -1 } ).skip( 100 ).limit( 1 )
 * 
 * The correct result will be:
 * 
 * { "_id" : ObjectId("50906d7fa3c412bb040eb709"), "student_id" : 100, "type" :
 * "homework", "score" : 88.50425479139126 } 
 * 
 * Now let us sort the students by student_id , and score, while also 
 * displaying the type to then see what the top five docs are:
 * 
 * db.grades.find( { }, { 'student_id' : 1, 'type' : 1, 'score' : 1, '_id' : 0 }
 * ).sort( { 'student_id' : 1, 'score' : 1, } ).limit( 5 )
 * 
 * The result set should be:
 * 
 * { "student_id" : 0, "type" : "quiz", "score" : 31.95004496742112 }
 * { "student_id" : 0, "type" : "exam", "score" : 54.6535436362647 } 
 * { "student_id" : 0, "type" : "homework", "score" : 63.98402553675503 } 
 * { "student_id" : 1, "type" : "homework", "score" : 44.31667452616328 } 
 * { "student_id" : 1, "type" : "exam", "score" : 74.20010837299897 } 
 * 
 * To verify that you have completed this task correctly, provide the identity 
 * of the student with the highest average in the class with following query 
 * that uses the aggregation framework. The answer will appear in the _id field 
 * of the resulting document.
 * 
 * db.grades.aggregate( { '$group' : { '_id' : '$student_id', 'average' : { $avg :
 * '$score' } } }, { '$sort' : { 'average' : -1 } }, { '$limit' : 1 } ) 
 * 
 * Enter the student ID below. Please enter just the number, with no spaces, 
 * commas or other characters.
 */
 
/*
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! WARNING !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 * 
 * Please notice that this script will delete records from your db so if you
 * want to execute it again, you will have to import the collection again using
 * the db_setup script.
 * 
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! WARNING !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 */
 
 // Gets the DB.
var db = db.getSiblingDB('students');

// Checks for DB integrity.
var gradesCount = db.grades.count();
print("\nGrades count for DB integrity check (you should get 800) : " + gradesCount);

// Performs the query. Gets all the homeworks and sorts them by student_id and 
// score.
var cursor = db.grades.find( 
								{ type : "homework" }
							)
						.sort(
								{ 
								student_id : 1,
								score: 1
								}
							);

// Deletes the lowest homework score for each students.
print("\nDeleting lowest graded homework...")
var previousStudentId = undefined;
while(cursor.hasNext()){
	var currentDocument = cursor.next();
	
	// If the student_id is different from the previous one, this means that this is
	// the student's lowest graded homework (they are sorted by score for each 
	// student).
	if (currentDocument.student_id != previousStudentId) {
        var id = currentDocument._id;
		db.grades.deleteOne({"_id" : id});
    }		
	// The current document ID becomes the new previous one. 	
    previousStudentId = currentDocument.student_id;
}

// Checks the new number of documents (should be 600).
var newRecordCount = db.grades.count();
print("\nChecking the new document count after delete (should be 600) : " + newRecordCount );

// Checks the 101st best student.
print("\nChecking the 101st best grade across all grades (the result should be " + 
	"{ \"_id\" : ObjectId(\"50906d7fa3c412bb040eb709\"), \"student_id\" : 100, " + 
	"\"type\" : \"homework\", \"score\" : 88.50425479139126 } : ");
var best101st = db.grades.find()
						.sort( { 'score' : -1 } )
						.skip( 100 )
						.limit( 1 );
while(best101st.hasNext()){
	printjson(best101st.next());
} 						
// Checks the top 5 documents.
print("\nChecking top 5 documents sorting by student_id and score.")
var expectedTop5 = [
"{ \"student_id\" : 0, \"type\" : \"quiz\", \"score\" : 31.95004496742112 }",
"{ \"student_id\" : 0, \"type\" : \"exam\", \"score\" : 54.6535436362647 }",
"{ \"student_id\" : 0, \"type\" : \"homework\", \"score\" : 63.98402553675503 }",
"{ \"student_id\" : 1, \"type\" : \"homework\", \"score\" : 44.31667452616328 }",
"{ \"student_id\" : 1, \"type\" : \"exam\", \"score\" : 74.20010837299897 }"
];
var actualTop5 = db.grades.find( 
									{ }, 
									{ 
										'student_id' : 1, 
										'type' : 1, 
										'score' : 1, 
										'_id' : 0 
									}
								)
							.sort( 
									{ 
										'student_id' : 1,
										'score' : 1 
									} 
								)
							.limit( 5 );
var counter = 0;
while(actualTop5.hasNext()){
	print("Expected record [" + (counter + 1) + "] : ");
	print(expectedTop5[counter]);
	print("Actual record [" + (counter + 1) + "] : ");
	printjson(actualTop5.next());
	counter++;
}

// Gets and prints the result.
var solution = db.grades.aggregate( 
									{ 
										'$group' : 
													{ 
														'_id' : '$student_id', 
														'average' : { $avg : '$score' } 
													} 
									}, 
									{ 
										'$sort' : 
													{ 
														'average' : -1 
													} 
									}, 
									{ '$limit' : 1 } 
								);
print("\nSolution : ");	
while(solution.hasNext()){
	printjson(solution.next());
} 						