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
var db = db.getSiblingDB('photos');

// Adds an index to speed up the process.
db.albums.createIndex(
					{
						images : 1
					}
);

// Gets all the photos
var photos = db.images.find();

// For each photo, if the id is on one of the album, its skipped, otherwise 
// is deleted.
while(photos.hasNext()){
	var currentPhoto = photos.next();
	
	// Checks that there's at least one album for the photo.
	var album = db.albums.findOne(
				{
					images : currentPhoto._id
				}
	);
	
	// If no album is found for that image, the image is an orphan and thus
	// is deleted.
	if(album == null){
		db.images.deleteOne(currentPhoto);
	}
}

// Prints the solution.
var solution = db.images.find(
							{
								tags : "sunrises"
							}
						)
						.count();
printjson("Solution : " + solution);