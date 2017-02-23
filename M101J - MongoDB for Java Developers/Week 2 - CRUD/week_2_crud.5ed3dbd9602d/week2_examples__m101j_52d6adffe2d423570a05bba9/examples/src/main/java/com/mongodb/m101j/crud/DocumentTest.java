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

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.util.Arrays;
import java.util.Date;

import static com.mongodb.m101j.util.Helpers.printJson;

public class DocumentTest {
    public static void main(String[] args) {
        Document document = new Document()
                            .append("str", "MongoDB, Hello")
                            .append("int", 42)
                            .append("l", 1L)
                            .append("double", 1.1)
                            .append("b", false)
                            .append("date", new Date())
                            .append("objectId", new ObjectId())
                            .append("null", null)
                            .append("embeddedDoc", new Document("x", 0))
                            .append("list", Arrays.asList(1, 2, 3));

        printJson(document);

        BsonDocument bsonDocument = new BsonDocument("str", new BsonString("MongoDB, Hello"));
    }
}
