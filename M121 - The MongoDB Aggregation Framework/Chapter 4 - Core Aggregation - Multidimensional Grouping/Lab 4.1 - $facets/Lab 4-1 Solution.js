/*
 * MIT License
 * 
 * Copyright (c) 2018 Donato Rimenti
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
 
// Builds the pipeline.
var pipeline = [
    { $match : { 
	    "imdb.rating" : { $gt : 0 },
        "metacritic" : { $gt : 0 }
		}		
	},
    { $facet : { 
	    "topTenImdb" : [		
			{ $sort : { "imdb.rating" : -1 } },
			{ $limit : 10 }
		],
		"topTenMetacritic" : [
			{ $sort : { "metacritic" : -1 } },
			{ $limit : 10 }
	    ]}
	},
	{ $project : {
	    "commonTopFilms" : {
			$size : {
				$setIntersection : [ "$topTenImdb", "$topTenMetacritic" ]
			}
		}	
	}
}];

// Prints the result.
var result = db.movies.aggregate(pipeline);
print("Result: ");
while (result.hasNext()) {
	printjson(result.next());
}