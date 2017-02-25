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

package com.mongodb;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import spark.Request;
import spark.Response;
import spark.Route;
import spark.Spark;

import java.io.StringWriter;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

public class SparkHomework {
    private static final Logger logger = LoggerFactory.getLogger("logger");

    public static void main(String[] args) throws UnknownHostException {
        final Configuration configuration = new Configuration();
        configuration.setClassForTemplateLoading(
                SparkHomework.class, "/");

        Spark.get(new Route("/") {
            @Override
            public Object handle(final Request request,
                                 final Response response) {
                StringWriter writer = new StringWriter();
                try {
                    Template helloTemplate = configuration.getTemplate("answer.ftl");

                    Map<String, String> answerMap = new HashMap<String, String>();
                    answerMap.put("answer", createAnswer());

                    helloTemplate.process(answerMap, writer);
                } catch (Exception e) {
                    logger.error("Failed", e);
                    halt(500);
                }
                return writer;
            }
        });
    }

    // Create a silly answer that's not obvious just by code inspection.  Easier just to get it running!
    private static String createAnswer() {
        int i = 0;
        for (int bit = 0; bit < 16; bit++) {
            i |= bit << bit;
        }
        return Integer.toString(i);
    }
}
