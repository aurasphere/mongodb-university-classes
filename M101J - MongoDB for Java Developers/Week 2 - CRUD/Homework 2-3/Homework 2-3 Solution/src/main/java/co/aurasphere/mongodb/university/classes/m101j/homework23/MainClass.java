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
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
package co.aurasphere.mongodb.university.classes.m101j.homework23;

import java.util.Arrays;
import java.util.List;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Accumulators;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Sorts;

/**
 * Solution of Homework 2-3 from MongoDB University M101J's class.
 * 
 * @author Donato Rimenti
 */
public class MainClass {

	/**
	 * The main method.
	 *
	 * @param args
	 *            the arguments
	 */
	public static void main(String[] args) {

		MongoClient client = new MongoClient();
		MongoDatabase numbersDB = client.getDatabase("students");
		MongoCollection<Document> grades = numbersDB.getCollection("grades");

		// Gets all the grades.
		MongoCursor<Document> cursor = grades
				.find(Filters.eq("type", "homework"))
				.sort(Sorts.ascending("student_id", "score")).iterator();

		Object previousStudentId = null;
		try {
			// Finds the lowest homework score.
			while (cursor.hasNext()) {
				Document entry = cursor.next();
				
				// If the student_id is different from the previous one, this 
				// means that this is the student's lowest graded homework 
				// (they are sorted by score for each student).
				if (!entry.get("student_id").equals(previousStudentId)) {
					Object id = entry.get("_id");
					grades.deleteOne(Filters.eq("_id", id));

				}
				
				// The current document ID becomes the new previous one.   
				previousStudentId = entry.get("student_id");
			}

			// Gets the student with the highest average in the class.
			AggregateIterable<Document> results = grades.aggregate(Arrays
					.asList(Aggregates.group("$student_id",
							Accumulators.avg("average", "$score")),
							Aggregates.sort(Sorts.descending("average")),
							Aggregates.limit(1)));

			// There should be only one result. Prints it.
			System.out.println("Solution : "
					+ results.iterator().next().toJson());

		} finally {
			cursor.close();
		}

		client.close();
	}

}