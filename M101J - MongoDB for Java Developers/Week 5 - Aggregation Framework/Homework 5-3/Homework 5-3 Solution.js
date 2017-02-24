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
var db = db.getSiblingDB('test');

// Calculates the highest average class.
var cursor = db.grades.aggregate( 

        // Unwinds the scores.
		{ $unwind : "$scores" },
        
		// Gets only the homeworks and exams scores.
		{ $match : { "scores.type" : { $ne : "quiz" } } },
        
		// Calculates the average of each student.
		{ $group : 
		    { 
		        _id : 
		            { 
		                student_id : "$student_id", 
		                class_id : "$class_id" 
		            }, 
		        avg : { $avg : "$scores.score" } 
		    } 
		},
		
		// Calculates the class average.
        { $group : 
		    { 
		        _id : "$_id.class_id",
		        avg : { $avg : "$avg" } 
		    } 
		},
		
		// Sorts the averages desc.
        { $sort : { "avg" : -1 } },
        
		// Gets only the first result.
		{ $limit : 1 } 
);

// Prints the result.
print("Solution : ");
while (cursor.hasNext()) {
   printjson(cursor.next());
}