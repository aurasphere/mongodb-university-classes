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
var db = db.getSiblingDB('enron');

// Finds the emails and counts them.
var elements = db.messages.aggregate(
    [
        // Filters unused fields in order to 
        // make data lighter.
        { $project : 
            {
                "headers.From" : 1,
                "headers.To" : 1,
                "headers.Message-ID" : 1,
                "_id" : 0
            }
        },
        
		// Unwinds the recipients.
        { $unwind : "$headers.To" },
        
		// Removes duplicates recipients for
        // the same emails.
        { $group : 
            { _id : 
                {    
                    messageId : "$headers.Message-ID",
                    from : "$headers.From",
                    to : "$headers.To"
                }
            }
        },
		
        // Counts the emails.
        { $group : 
            { 
                _id : 
                    {
                        from : "$_id.from",
                        to : "$_id.to"
                    },
                emails : { $sum : 1 }
            }
        },
		
        // Sorts them by email count desc.
        { $sort : { emails : -1 } },
        
		// Gets only the first result.
        { $limit : 1 }
    ],
    
	// Option to handle more than 16MB
    // result collections.
    {allowDiskUse : true}
);

// Prints the result.
print("Solution : ");
while(elements.hasNext()){
    printjson(elements.next());
}
