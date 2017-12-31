@REM ==============================================================================
@REM MIT License                                                                   
@REM                                                                               
@REM Copyright (c) 2017 Donato Rimenti                                             
@REM                                                                               
@REM Permission is hereby granted, free of charge, to any person obtaining a copy  
@REM of this software and associated documentation files (the "Software"), to deal 
@REM in the Software without restriction, including without limitation the rights  
@REM to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     
@REM copies of the Software, and to permit persons to whom the Software is         
@REM furnished to do so, subject to the following conditions:                      
@REM                                                                               
@REM The above copyright notice and this permission notice shall be included in    
@REM all copies or substantial portions of the Software.                           
@REM                                                                               
@REM THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    
@REM IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      
@REM FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   
@REM AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        
@REM LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
@REM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
@REM SOFTWARE.                                                                     
@REM ==============================================================================
@REM																			   
@REM DESCRIPTION : Sets up the DB for MongoDB University M102's Week 6 homeworks. 
@REM AUTHOR : Donato Rimenti													   
@REM COPYRIGHT : Copyright (c) 2017 Donato Rimenti								   
@REM LICENSE : MIT																   
@REM																			   
@REM ==============================================================================

@REM Creates the data directories.
mkdir 1
mkdir 2
mkdir 3
mkdir 4

@REM Starts a server.
start mongod

@REM Waits for the server.
timeout 5

@REM Inits the homework.
mongo week6 --eval "load('chapter_6_scalability/week6__hw6.1_m102_52b491d5e2d4237593ca1d3a.js'); try{ homework.init(); } catch(e){} db.getSiblingDB('admin').shutdownServer();"

@REM Waits for the servers.
timeout 2

@REM Starts the servers for the replica set.
start mongod --shardsvr
start mongod --configsvr --replSet csReplSet --port 27019 --dbpath 1
start mongod --configsvr --replSet csReplSet --port 27020 --dbpath 2
start mongod --configsvr --replSet csReplSet --port 27021 --dbpath 3

@REM Waits for the servers.
timeout 5

@REM Inits the replica set.
mongo --port 27019 --eval "try {rs.initiate({ _id: 'csReplSet', members:[{ _id : 0, host : 'localhost:27019' }, { _id : 1, host : 'localhost:27020' }, { _id : 2, host : 'localhost:27021' }]}); } catch(e){}"

@REM Starts mongos.
start mongos --configdb csReplSet/localhost:27019

@REM Starts another server for homework 6.3.
start mongod --shardsvr --dbpath 4 --port 27022