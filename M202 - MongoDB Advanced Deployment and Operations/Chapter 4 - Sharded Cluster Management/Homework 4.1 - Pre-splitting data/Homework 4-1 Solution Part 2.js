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
var db = db.getSiblingDB("admin");

// Configures the shard.
db.runCommand({"addShard": "localhost:27001", "name": "shard0"});
db.runCommand({"addShard": "localhost:27002", "name": "shard1"});
db.runCommand({"addShard": "localhost:27003", "name": "shard2"});
sh.enableSharding("m202");
sh.shardCollection("m202.presplit", {"a": 1});

// Starts the presplitting.
sh.splitAt("m202.presplit", {"a": 0});
sh.splitAt("m202.presplit", {"a": 7});
sh.splitAt("m202.presplit", {"a": 10});
sh.splitAt("m202.presplit", {"a": 14});
sh.splitAt("m202.presplit", {"a": 15});
sh.splitAt("m202.presplit", {"a": 20});
sh.splitAt("m202.presplit", {"a": 21});
sh.splitAt("m202.presplit", {"a": 22});
sh.splitAt("m202.presplit", {"a": 23});
sh.splitAt("m202.presplit", {"a": 24});

// Stops the balancer during data moving.
sh.stopBalancer();

// Moves the splitted data into the created shards.
sh.moveChunk("m202.presplit", {"a": 0}, "shard0");
sh.moveChunk("m202.presplit", {"a": 7}, "shard0");
sh.moveChunk("m202.presplit", {"a": 10}, "shard0");
sh.moveChunk("m202.presplit", {"a": 14}, "shard1");
sh.moveChunk("m202.presplit", {"a": 15}, "shard1");
sh.moveChunk("m202.presplit", {"a": 20}, "shard1");
sh.moveChunk("m202.presplit", {"a": 21}, "shard2");
sh.moveChunk("m202.presplit", {"a": 22}, "shard2");
sh.moveChunk("m202.presplit", {"a": 23}, "shard2"); 

// Restarts the balancer.
sh.startBalancer();