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

// This is an alternative solution to the problem that can be used on a local
// database if for any reason the backup can't be restored.

// Put the result of the atlas_create_backup_data.js script here.
var timestamp = undefined;
var increment = undefined;

// Gets the local db.
db = db.getSiblingDB("local")

// Gets all the $set operations on otherNumber field from the oplog.
var list = db.oplog.rs.find( { "o.$set.otherNumber" : { $exists : true } } );

// Looks for the element with the timestamp and increment from the backup
// restore script and prints the number of elements before that one.
var counter = 0;
while (list.hasNext()){
	counter++;
	var currentElement = list.next();
	var currentIncrement = el.ts.i;
	var currentTimestamp = el.ts.t;
	
	// If the timestamp and the increment matches the current element, it
	// prints the number of elements before this one.
	if(currentTimestamp == timestamp && currentIncrement == increment){
		print("Solution : " + counter);
	}	
}