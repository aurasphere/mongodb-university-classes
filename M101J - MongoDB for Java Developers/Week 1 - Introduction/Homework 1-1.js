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
 *  Install MongoDB on your computer and run it on the standard port.
 * 
 * Download the HW1-1 from the Download Handout link and uncompress it.
 * 
 * Use mongorestore to restore the dump into your running mongod. Do this by
 * opening a terminal window (mac) or cmd window (windows) and navigating to the
 * directory so that you are in the parent directory of the dump directory (if
 * you used the default extraction method, it should be hw1/). Now type:
 * 
 * mongorestore dump
 * 
 * Note you will need to have your path setup correctly to find mongorestore.
 * 
 * Next, go into the Mongo shell, perform a findOne on the collection called hw1
 * in the database m101. That will return one document. Please provide the value
 * corresponding to the "answer" key from the document returned.
 * 
 * hint: if you got back a document that looks like { "_id": 1234, "answer":
 * 2468 }, you would put in 2468 (with no spaces) for your answer. This is not
 * the correct number; you should get a different number.
 */

// Gets the DB.
var db = db.getSiblingDB('m101');

// Finds the first element of the collection.
var element = db.hw1.findOne();

// Prints the result.
print("Solution : ");
printjson(element);
