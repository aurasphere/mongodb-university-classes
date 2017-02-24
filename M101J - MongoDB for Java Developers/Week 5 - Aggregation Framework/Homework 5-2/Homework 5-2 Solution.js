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

// Calculates the average population of cities from NY and CA.
var cursor = db.zips1.aggregate(

	// Gets only the cities from California and New York.
    { $match : { state: { $in : ['CA', 'NY'] } } }, 
    
	// Sums the populations of cities with multiple zip codes.
	{ $group : 
        { 
    	    _id : 
    	        { 
    		        state : "$state",
    		    	city : "$city"
    		    }, 
    	    pop: { $sum : "$pop" } 
    	} 
    }, 
    
	// Gets the cities with population greater than 25000.
	{ $match : { pop : { $gt : 25000 } } }, 
    
	// Calculates the average population.
	{ $group : 
        { 
    	    _id : null, 
    		pop : { $avg : "$pop" } 
    	} 
    } 
);

// Prints the result.
print("Solution : ");
while (cursor.hasNext()) {
   printjson(cursor.next());
}