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

 // Gets the DB.
var db = db.getSiblingDB('students');

// Performs the query. Gets all the homeworks and sorts them by student_id and 
// score.
var cursor = db.grades.find( { type : "homework" } )
.sort(
    { 
        student_id : 1,
        score: 1
    }
);

// Deletes the lowest homework score for each students.
var previousStudentId = undefined;
while(cursor.hasNext()){
    var currentDocument = cursor.next();
    
    // If the student_id is different from the previous one, this means that 
	// this is the student's lowest graded homework (they are sorted by score 
	// for each student).
    if (currentDocument.student_id != previousStudentId) {
        var id = currentDocument._id;
        db.grades.deleteOne({"_id" : id});
    }        
    // The current document ID becomes the new previous one.     
    previousStudentId = currentDocument.student_id;
}

// Gets and prints the result.
var result = db.grades.aggregate( 
    { $group : 
        { 
            _id : '$student_id', 
            average : { $avg : '$score' } 
        } 
    }, 
    { $sort : { average : -1 } }, 
    { $limit : 1 } 
);
                                
print("Solution : ");    
while(result.hasNext()){
    printjson(result.next());
}                         