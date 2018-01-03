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
@REM DESCRIPTION : Solution for MongoDB University M102's Final Exam Question 10.  
@REM AUTHOR : Donato Rimenti													   
@REM COPYRIGHT : Copyright (c) 2017 Donato Rimenti								   
@REM LICENSE : MIT																   
@REM																			   
@REM ==============================================================================

@REM Creates the data directories.
mkdir data
mkdir data\config
mkdir data\s1
mkdir data\s2

@REM Starts the config server.
start mongod --configsvr --dbpath data/config --replSet repl --port 27019

@REM Waits for the server.
timeout 5

@REM Inits the replica set.
mongo --port 27019 --eval "rs.initiate()"

@REM Waits for the server.
timeout 10

@REM Restores the config DB.
mongorestore --port 27019 ..\final_exam.127c39d04bb9\gene_backup_553f1c22d8ca396a7a77dfee\gene_backup\config_server

@REM Updates the shards configuration and closes the config one.
mongo config --port 27019 --eval "db.shards.update({_id:'s1'},{host:'localhost:27001'}); db.shards.update({_id:'s2'},{host:'localhost:27002'}); db = db.getSiblingDB('admin'); db.shutdownServer({force : true}); quit()"

@REM Waits for the server.
timeout 5

@REM Starts the shard servers and restarts the config one.
start mongod --port 27001 --dbpath data/s1 --shardsvr
start mongod --port 27002 --dbpath data/s2 --shardsvr
start mongod --configsvr --dbpath data/config --replSet repl --port 27019
start mongos --configdb repl/localhost:27019

@REM Restores the shards DB.
mongorestore --port 27001 ..\final_exam.127c39d04bb9\gene_backup_553f1c22d8ca396a7a77dfee\gene_backup\s1
mongorestore --port 27002 ..\final_exam.127c39d04bb9\gene_backup_553f1c22d8ca396a7a77dfee\gene_backup\s2

@REM Prints the solution.
mongo snps --eval "db.elegans.createIndex({N2:1,mutant:1}); var executionStats = db.elegans.find( { N2 : 'T', mutant : 'A' } ).limit( 5 ).explain( 'executionStats' ); print('Total shards queried : ' + executionStats.executionStats.executionStages.shards.length); print('Total documents examined : ' + executionStats.executionStats.totalDocsExamined);"
