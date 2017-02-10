// Gets the DB.
var db = db.getSiblingDB('m101');

var element = db.hw1.findOne();

// Prints the result.
printjson(element);
