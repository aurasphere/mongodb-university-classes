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
 
// Stops the balancer.
sh.stopBalancer();

// Moves half the chunks used by the query in order to balance it.
sh.moveChunk("m202.imbalance", { _id : ISODate("2014-07-17T00:00:00.001Z") }, "shard0001");
sh.moveChunk("m202.imbalance", { _id : ISODate("2014-07-18T00:00:00.001Z") }, "shard0001");
sh.moveChunk("m202.imbalance", { _id : ISODate("2014-07-19T00:00:00.001Z") }, "shard0001");

// Restarts the balancer.
sh.startBalancer();