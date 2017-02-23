/*
 * Copyright 2015 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.mongodb.m101j.crud;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.UpdateOptions;
import org.bson.Document;

import java.util.ArrayList;

import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Filters.gte;
import static com.mongodb.client.model.Updates.combine;
import static com.mongodb.client.model.Updates.inc;
import static com.mongodb.client.model.Updates.set;
import static com.mongodb.m101j.util.Helpers.printJson;


public class UpdateTest {
    public static void main(String[] args) {
        MongoClient client = new MongoClient();
        MongoDatabase database = client.getDatabase("course");
        MongoCollection<Document> collection = database.getCollection("test");

        collection.drop();

        // insert 8 documents, with both _id and x set to the value of the loop variable
        for (int i = 0; i < 8; i++) {
            collection.insertOne(new Document().append("_id", i)
                                         .append("x", i)
                                         .append("y", true));
        }

//        collection.replaceOne(eq("x", 5), new Document()
//                                                  .append("x", 20)
//                                                  .append("updated", true));
//
//        collection.updateOne(eq("x", 5), new Document("$set",
//                                                             new Document("x", 20)
//                                                                     .append("updated", true)));
//
//        collection.updateOne(eq("x", 5), combine(set("x", 20), set("updated", true)));
//
//
//        collection.updateOne(eq("x", 9), combine(set("x", 20), set("updated", true)),
//                new UpdateOptions().upsert(true));


        collection.updateMany(gte("x", 5), inc("x", 1));


        for (Document cur : collection.find().into(new ArrayList<Document>())) {
            printJson(cur);
        }
    }
}