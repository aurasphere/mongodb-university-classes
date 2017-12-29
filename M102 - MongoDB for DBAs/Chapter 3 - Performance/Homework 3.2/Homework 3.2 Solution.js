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

// Note: Open a Mongo shell and let homework.b() run for a bit before running this script.
// Gets the DB.
var db = db.getSiblingDB('performance');

 // Loads the homework JS.
load("../chapter_3_performance/performance__m102_performance_reorg_537a56c08bb48b7c467a20d3/performance.js");

// Finds the longest operation and kills it.
var longestOp;
db.currentOp().inprog.forEach( function(op) {
	if(longestOp == null || op.secs_running > longestOp.secs_running) {
			longestOp = op;
	}
}); 
db.killOp(longestOp.opid)

// Gets the result.
var result = homework.c();

// Prints the result.
print("Solution : " + result);