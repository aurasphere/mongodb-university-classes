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

 // Loads the homework JS.
load("../chapter_2_crud_and_administrative_commands/Homework2__hw2.1_m102_529fe537e2d42347509fb412.js");

// Inserts the new record.
db.products.insert({
        "_id" : "ac9",
        "name" : "AC9 Phone",
        "brand" : "ACME",
        "type" : "phone",
        "price" : 333,
        "warranty_years" : 0.25,
        "available" : true
});

// Finds the required record and updates it.
var record = db.products.findOne({
	_id : ObjectId("507d95d5719dbef170f15c00")
});
record.term_years = 3; 
record.limits.sms.over_rate=0.01; 
db.products.save(record); 

// Executes the checking script.
var result = homework.b();

// Prints the result.
print("Solution : " + result);