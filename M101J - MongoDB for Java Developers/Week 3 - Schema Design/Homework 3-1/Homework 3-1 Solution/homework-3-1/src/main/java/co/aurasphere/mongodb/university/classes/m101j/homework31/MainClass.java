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
package co.aurasphere.mongodb.university.classes.m101j.homework31;

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
 * Solution of Homework 3-1 from MongoDB University M101J's class.
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
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		MongoClient client = new MongoClient();
		MongoDatabase db = client.getDatabase("school");
		MongoCollection<Document> students = db.getCollection("students");

		// Gets all the students.
		MongoCursor<Document> cursor = students.find().iterator();

		try {
			while (cursor.hasNext()) {
				Document student = cursor.next();
				List<Document> scores = (List<Document>) student.get("scores");

				// Finds the lowest homework score.
				Document minScoreObj = null;
				double minScore = Double.MAX_VALUE;

				for (Document scoreDocument : scores) {
					double score = scoreDocument.getDouble("score");
					String type = scoreDocument.getString("type");

					// Swaps the scores.
					if (type.equals("homework") && score < minScore) {
						minScore = score;
						minScoreObj = scoreDocument;
					}
				}

				// Removes the lowest score.
				if (minScoreObj != null) {
					scores.remove(minScoreObj);
				}

				// Updates the record.
				students.updateOne(Filters.eq("_id", student.get("_id")),
						new Document("$set", new Document("scores", scores)));
			}
		
		// Gets the student with the highest average in the class.
		AggregateIterable<Document> results = students.aggregate(Arrays.asList(
				Aggregates.unwind("$scores"),
				Aggregates.group("$_id",
						Accumulators.avg("average", "$scores.score")),
				Aggregates.sort(Sorts.descending("average")), Aggregates.limit(1)));
		
		// There should be only one result. Prints it.
		System.out.println("Solution : " + results.iterator().next().toJson());
			
		} finally {
			cursor.close();
		}

		client.close();
	}

}
