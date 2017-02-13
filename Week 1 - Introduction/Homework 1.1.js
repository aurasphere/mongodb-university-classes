/**
 * Install MongoDB on your computer and run it on the standard port.
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

var element = db.hw1.findOne();

// Prints the result.
printjson(element);
