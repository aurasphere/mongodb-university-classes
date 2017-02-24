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

// Calculates the total populations of city which starts with a numeric digit.
var cursor = db.zips2.aggregate(

	// Removes unused fields and gets the first digit of the city.
    { $project : 
	    {
    	    first_char : {$substr : [ "$city", 0, 1] },
			pop : 1,
			city : "$city",
			zip : "$_id",
			state : 1
        }
    },
	
	// Gets only the cities whose zip code starts with a digit.
	{ $match : 
	    {
			first_char : /\d/
		}
	},
	
	// Calculates the total population.
    { $group :
        {
            _id : null,
            pop : { $sum : "$pop"}
        }
    }
);

// Prints the result.
print("Solution : ");
while (cursor.hasNext()) {
   printjson(cursor.next());
}