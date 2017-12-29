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
var db = db.getSiblingDB('pcat');

// Builds the index.
db.products.createIndex({for: 1}); 

// Gets the execution stats for the query.
var executionStats = db.products.find({for: "ac3"}).explain("executionStats");

// Gets the results.
var resultOne = db.products.find({for: "ac3"}).count();
var resultTwo = executionStats.executionStats.totalDocsExamined;
var resultThree = executionStats.executionStats.executionStages.inputStage.stage == "IXSCAN";

// Prints the results.
print("Products matching the query : " + resultOne);
print("Total documents examined : " + resultTwo);
print("Index used : " + resultThree);